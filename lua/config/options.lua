-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- 配色为暗色主题
vim.opt.background = "dark"
-- 关闭自动格式化
vim.g.autoformat = false

-- 设置tap为四个空格
-- 将 Tab 转换为空格（核心开关）
vim.opt.expandtab = true 
-- 设置缩进步长为 4 个空格
vim.opt.shiftwidth = 4 
-- 设置界面上一个 Tab 显示的宽度为 4
vim.opt.tabstop = 4 
-- 使得在插入模式下按 Tab 或退格键时，系统视其为 4 个空格
vim.opt.softtabstop = 4

if vim.g.vscode then
  vim.opt.smoothscroll = true -- 配合 VS Code 的平滑滚动
  vim.opt.timeoutlen = 300 -- 缩短快捷键等待时间
end

-- 添加powershell作为
-- 检测 PowerShell 7 是否安装
local has_pwsh = vim.fn.executable("pwsh") == 1

if has_pwsh then
  vim.opt.shell = "pwsh"
  vim.opt.shellcmdflag =
    "-NoLogo -Binary -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
  vim.opt.shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait"
  vim.opt.shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; if($?) { exit $lastExitCode }"
  vim.opt.shellquote = ""
  vim.opt.shellxquote = ""
end

-- 关键：处理 Windows 与 Unix 路径差异
-- 开启 shellslash 可以让 Neovim 在内部处理路径时自动将 \ 转换为 /
-- 这对 Telescope 搜索和 LSP 跳转非常友好
vim.opt.shellslash = true

