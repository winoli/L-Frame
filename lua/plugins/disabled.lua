-- 如果当前不是 VSCode 环境，直接返回空配置（不禁用任何插件）
if not vim.g.vscode then
  return {}
end

return {
  -- -----------------------------------------------------------------------
  -- 1. 禁用 UI 和外观类插件 (VSCode 已有原生界面)
  -- -----------------------------------------------------------------------
  { "folke/tokyonight.nvim", enabled = false }, -- 主题
  { "folke/noice.nvim", enabled = false },      -- 消息通知 UI
  { "rcarriga/nvim-notify", enabled = false },  -- 通知弹窗
  { "folke/zen-mode.nvim", enabled = false },   -- 禅模式
  { "folke/twilight.nvim", enabled = false },   -- 聚焦模式
  { "folke/which-key.nvim", enabled = false },  -- 按键提示 (VSCode 不需要)
  { "folke/todo-comments.nvim", enabled = false }, -- TODO 高亮 (VSCode 插件处理更好)
  { "folke/trouble.nvim", enabled = false },    -- 错误列表
  { "nvim-lualine/lualine.nvim", enabled = false }, -- 底部状态栏
  { "akinsho/bufferline.nvim", enabled = false },   -- 顶部标签栏
  { "nvim-neo-tree/neo-tree.nvim", enabled = false }, -- 文件资源管理器

  -- -----------------------------------------------------------------------
  -- 2. 禁用功能类插件 (避免与 VSCode 功能冲突)
  -- -----------------------------------------------------------------------
  { "folke/lazydev.nvim", enabled = false },    -- Lua 开发工具
  { "folke/persistence.nvim", enabled = false },-- 会话管理
  { "folke/edgy.nvim", enabled = false },       -- 侧边栏布局管理

  -- Treesitter: VSCode 自带语法高亮，禁用它可以大幅提升性能
  { "nvim-treesitter/nvim-treesitter", enabled = false },

  -- LSP/Mason: 代码补全和诊断由 VSCode 负责，Neovim 端应禁用以防冲突
  { "mason-org/mason.nvim", enabled = false },
  { "neovim/nvim-lspconfig", enabled = false },

  -- -----------------------------------------------------------------------
  -- 3. 禁用 Mini 系列插件
  -- 注意：作者是 nvim-mini，不是 folke。
  -- -----------------------------------------------------------------------
  { "nvim-mini/mini.ai", enabled = false },        -- 增强的文本对象 (建议保留，但按需禁用)
  { "nvim-mini/mini.comment", enabled = false },   -- 注释 (VSCode 有 ctrl+/)
  { "nvim-mini/mini.pairs", enabled = false },     -- 自动补全括号
  { "nvim-mini/mini.surround", enabled = false },  -- 包围字符处理
  { "nvim-mini/mini.indentscope", enabled = false },
  { "nvim-mini/mini.statusline", enabled = false },
  { "nvim-mini/mini.starter", enabled = false },
  { "nvim-mini/mini.sessions", enabled = false },
  { "nvim-mini/mini.bufremove", enabled = false },
  { "nvim-mini/mini.cursorword", enabled = false },
  { "nvim-mini/mini.hipatterns", enabled = false },
  { "nvim-mini/mini.pick", enabled = false },
  { "nvim-mini/mini.operators", enabled = false },
  { "nvim-mini/mini.splitjoin", enabled = false },
  { "nvim-mini/mini.trailspace", enabled = false },
  { "nvim-mini/mini.visits", enabled = false },
  { "nvim-mini/mini.extra", enabled = false },
  { "nvim-mini/mini.animate", enabled = false },
  { "nvim-mini/mini.bracketed", enabled = false },
  { "nvim-mini/mini.completion", enabled = false },
  { "nvim-mini/mini.doc", enabled = false },
  { "nvim-mini/mini.fuzzy", enabled = false },
  { "nvim-mini/mini.git", enabled = false },
  { "nvim-mini/mini.icons", enabled = false },
  { "nvim-mini/mini.jump", enabled = false },
  { "nvim-mini/mini.jump2d", enabled = false },
  { "nvim-mini/mini.map", enabled = false },
  { "nvim-mini/mini.misc", enabled = false },
  { "nvim-mini/mini.notify", enabled = false },
  { "nvim-mini/mini.tabline", enabled = false },
}