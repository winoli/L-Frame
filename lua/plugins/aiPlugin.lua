-- AI 插件 配置
-- 配置apiKey.json配置在lua/config/asset下
-- 配置示例
--[[
{
    "default_chat": "deepseek",
    "default_inline": "deepseek",
    "services": {
        "deepseek": {
            "provider": "openai_compatible",
            "url": "https://api.deepseek.com",
            "key": "sk-xxxxxx",
            "model": "deepseek-chat",
            "temperature": 0.3,
            "max_tokens": 4096
        }
    }
}
--]]
-- 1. 安全读取并解析 JSON

local function load_ai_env()
  local path = vim.fn.stdpath("config") .. "/lua/config/asset/aikey.json"
  local file = io.open(path, "r")
  if not file then
    return nil
  end
  local content = file:read("*a")
  file:close()
  local ok, decoded = pcall(vim.fn.json_decode, content)
  return ok and decoded or nil
end

local ai_env = load_ai_env()

return {
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = function()
      if not ai_env or not ai_env.services then return {} end

      local adapters_lib = require("codecompanion.adapters")
      local built_adapters = {}

      -- 1. 动态遍历 JSON，生成适配器对象池
      for name, config in pairs(ai_env.services) do
        -- 强制使用 openai 模板以确保最大兼容性
        built_adapters[name] = adapters_lib.extend("openai_compatible", {
          env = {
            url = config.url,
            api_key = config.key,
          },
          schema = {
            model = { default = config.model },
            -- 从 JSON 读取参数，并设置 fallback 默认值
            temperature = { default = config.temperature or 0.7 },
            max_tokens = { default = config.max_tokens or 4096 },
          },
          
        })
      end

      -- 2. 获取默认适配器对象
      local default_name = ai_env.default_chat or next(built_adapters)
      local default_adapter_obj = built_adapters[default_name]

      -- 3. 返回配置表
      return {
        strategies = {
          -- 直接传递对象，不传字符串，物理屏蔽 "Adapter not found" 错误
          chat = { 
            adapter = default_adapter_obj,
            slash_commands = {  
              -- ✅ 关键：/project 命令 - 读取整个工作区结构  
              ["project"] = {  
                callback = function(chat)
                  -- 使用 plenary 的 scan 工具扫描目录
                  local scan = require("plenary.scandir")
                  local files = scan.scan_dir(".", { hidden = false, add_dirs = false, depth = 3 })
                  
                  local content = "当前项目文件列表：\n" .. table.concat(files, "\n")
                  
                  chat:add_message({
                    role = "user",
                    content = content,
                  }, { visible = false }) -- 在 UI 中隐藏，但发给 AI
                  
                  vim.notify("已将项目文件列表同步至 AI 上下文")
                end,
                description = "Load workspace context",  
                opts = {  
                  contains_code = true,  
                },  
              },  
            }, 
          },
          inline = { adapter = default_adapter_obj },
          cmd = { adapter = default_adapter_obj },
        },
        -- 虽然我们直连了对象，但把它们也写进 adapters 表，方便以后在 UI 中切换
        adapters = built_adapters,
        display = {
          chat = {
            window = { layout = "vertical", width = 45 },
            -- 确保不隐藏这些标签，让我们通过高亮来处理
            show_settings = true,
          },
        },
      }
    end,
    config = function(_, opts)
      require("codecompanion").setup(opts)

      -- 1. 配置高亮逻辑：将 <think> 标签内容显示为灰色/斜体（跟随 Comment 高亮组）
      local group = vim.api.nvim_create_augroup("CodeCompanionHooks", { clear = true })
      
      vim.api.nvim_create_autocmd("FileType", {
        group = group,
        pattern = "codecompanion",
        callback = function()
          -- 定义名为 CodeCompanionThink 的语法区域
          -- 匹配 <think> ... </think> 之间的内容
          vim.cmd([[syntax region CodeCompanionThink start="<think>" end="</think>" keepend]])
          
          -- 将其链接到 Comment 高亮组 (通常是灰色/斜体，你也可以改成 String 或 Error 等)
          vim.cmd([[highlight link CodeCompanionThink Comment]])
        end,
      })

      -- 快捷键
      vim.keymap.set({ "n", "v" }, "<leader>ac", "<cmd>CodeCompanionChat Toggle<cr>", { desc = "AI Chat" })
      vim.keymap.set({ "n", "v" }, "<leader>ai", "<cmd>CodeCompanion<cr>", { desc = "AI Inline" })
      vim.keymap.set("n", "<leader>ap", "<cmd>CodeCompanionActions<cr>", { desc = "AI Actions" })
    end,
  },
}