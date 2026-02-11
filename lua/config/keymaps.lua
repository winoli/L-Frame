-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--

if vim.g.vscode then
  local vscode = require("vscode-neovim")
  -- 打开符号跳转 (Go to Symbol)
  vim.keymap.set("n", "<leader>ss", function()
    vscode.call("workbench.action.gotoSymbol")
  end)
  -- ==========================================================================
  -- 1. 文件与搜索 (替代 Telescope)
  -- ==========================================================================
  -- 查找文件
  vim.keymap.set("n", "<leader><space>", function()
    vscode.call("workbench.action.quickOpen")
  end, { desc = "Find Files" })
  vim.keymap.set("n", "<leader>ff", function()
    vscode.call("workbench.action.quickOpen")
  end)
  -- 全局搜索文本
  vim.keymap.set("n", "<leader>/", function()
    vscode.call("workbench.action.findInFiles")
  end, { desc = "Search Project" })
  -- 查找最近文件 (Recent Files)
  vim.keymap.set("n", "<leader>fr", function()
    vscode.call("workbench.action.openRecent")
  end, { desc = "Recent" })

  -- ==========================================================================
  -- 2. 代码重构与导航 (替代 LSP 插件)
  -- ==========================================================================
  -- 显示符号表 (Symbol Outline)
  vim.keymap.set("n", "<leader>cs", function()
    vscode.call("workbench.action.gotoSymbol")
  end, { desc = "Symbols" })
  -- 代码重命名
  vim.keymap.set("n", "<leader>cr", function()
    vscode.call("editor.action.rename")
  end, { desc = "Rename" })
  -- 快速修复 (Code Actions)
  vim.keymap.set("n", "<leader>ca", function()
    vscode.call("editor.action.quickFix")
  end, { desc = "Code Action" })
  -- 跳转定义
  vim.keymap.set("n", "gd", function()
    vscode.call("editor.action.revealDefinition")
  end, { desc = "Goto Definition" })

  -- ==========================================================================
  -- 3. UI 交互 (替代 Noice/Bufferline)
  -- ==========================================================================
  -- 关闭所有通知
  vim.keymap.set("n", "<leader>un", function()
    vscode.call("notifications.clearAll")
  end, { desc = "Dismiss All Notifications" })
  -- 切换侧边栏 (Explorer)
  vim.keymap.set("n", "<leader>e", function()
    vscode.call("workbench.action.toggleSidebarVisibility")
  end, { desc = "Toggle Explorer" })
  -- 切换底栏面板 (Terminal/Output)
  vim.keymap.set("n", "<leader>fT", function()
    vscode.call("workbench.action.togglePanel")
  end, { desc = "Toggle Panel" })

  -- ==========================================================================
  -- 4. 编辑增强
  -- ==========================================================================
  -- 格式化代码 (使用 VS Code 配置的 Formatter)
  vim.keymap.set({ "n", "v" }, "<leader>cf", function()
    vscode.call("editor.action.formatDocument")
  end, { desc = "Format Document" })
else
  -- 映射 Alt+o 切换头文件/源文件
  vim.keymap.set("n", "<A-o>", "<cmd>ClangdSwitchSourceHeader<cr>", { desc = "Switch Source/Header (Alt-O)" })

  -- 映射 <leader>gs 切换头文件/源文件
  vim.keymap.set("n", "gs", "<cmd>ClangdSwitchSourceHeader<cr>", { desc = "Switch Source/Header (Leader)" })
end
