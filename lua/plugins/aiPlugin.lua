-- AI 插件 配置
-- 配置apiKey.json配置在lua/config下
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
  local path = vim.fn.stdpath("config") .. "/lua/config/aikey.json"
  local file = io.open(path, "r")
  if not file then return nil end
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
      print("default_name = " .. default_name)

      -- 3. 返回配置表
      return {
        strategies = {
          -- 直接传递对象，不传字符串，物理屏蔽 "Adapter not found" 错误
          chat = { adapter = default_adapter_obj },
          inline = { adapter = default_adapter_obj },
        },
        -- 虽然我们直连了对象，但把它们也写进 adapters 表，方便以后在 UI 中切换
        adapters = built_adapters,
        display = {
          chat = { window = { layout = "vertical", width = 45 } },
        },
      }
    end,
    config = function(_, opts)
      require("codecompanion").setup(opts)

      -- 快捷键
      vim.keymap.set({ "n", "v" }, "<leader>ac", "<cmd>CodeCompanionChat Toggle<cr>", { desc = "AI Chat" })
      vim.keymap.set({ "n", "v" }, "<leader>ai", "<cmd>CodeCompanion<cr>", { desc = "AI Inline" })
      vim.keymap.set("n", "<leader>ap", "<cmd>CodeCompanionActions<cr>", { desc = "AI Actions" })
    end,
  },
}