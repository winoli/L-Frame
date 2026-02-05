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
  { "folke/snacks.nvim", enabled = false },     -- LazyVim 新版工具集 (包含 dashboard 等)
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
  { "folke/flash.nvim", enabled = false },      -- 快速跳转 (可选，很多人在 VSCode 中喜欢保留 Flash)
  { "folke/persistence.nvim", enabled = false },-- 会话管理
  { "folke/edgy.nvim", enabled = false },       -- 侧边栏布局管理

  -- Treesitter: VSCode 自带语法高亮，禁用它可以大幅提升性能
  { "nvim-treesitter/nvim-treesitter", enabled = false },

  -- LSP/Mason: 代码补全和诊断由 VSCode 负责，Neovim 端应禁用以防冲突
  { "williamboman/mason.nvim", enabled = false },
  { "neovim/nvim-lspconfig", enabled = false },

  -- -----------------------------------------------------------------------
  -- 3. 禁用 Mini 系列插件
  -- 注意：作者是 echasnovski，不是 folke。
  -- -----------------------------------------------------------------------
  { "echasnovski/mini.ai", enabled = false },        -- 增强的文本对象 (建议保留，但按需禁用)
  { "echasnovski/mini.comment", enabled = false },   -- 注释 (VSCode 有 ctrl+/)
  { "echasnovski/mini.pairs", enabled = false },     -- 自动补全括号
  { "echasnovski/mini.surround", enabled = false },  -- 包围字符处理
  { "echasnovski/mini.indentscope", enabled = false },
  { "echasnovski/mini.statusline", enabled = false },
  { "echasnovski/mini.starter", enabled = false },
  { "echasnovski/mini.sessions", enabled = false },
  { "echasnovski/mini.bufremove", enabled = false },
  { "echasnovski/mini.cursorword", enabled = false },
  { "echasnovski/mini.hipatterns", enabled = false },
  { "echasnovski/mini.pick", enabled = false },
  { "echasnovski/mini.operators", enabled = false },
  { "echasnovski/mini.splitjoin", enabled = false },
  { "echasnovski/mini.trailspace", enabled = false },
  { "echasnovski/mini.visits", enabled = false },
  { "echasnovski/mini.extra", enabled = false },
  { "echasnovski/mini.animate", enabled = false },
  { "echasnovski/mini.bracketed", enabled = false },
  { "echasnovski/mini.completion", enabled = false },
  { "echasnovski/mini.doc", enabled = false },
  { "echasnovski/mini.fuzzy", enabled = false },
  { "echasnovski/mini.git", enabled = false },
  { "echasnovski/mini.icons", enabled = false },
  { "echasnovski/mini.jump", enabled = false },
  { "echasnovski/mini.jump2d", enabled = false },
  { "echasnovski/mini.map", enabled = false },
  { "echasnovski/mini.misc", enabled = false },
  { "echasnovski/mini.notify", enabled = false },
  { "echasnovski/mini.tabline", enabled = false },
}