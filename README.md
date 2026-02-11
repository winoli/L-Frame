# 💤 LazyVim

A custom starter for [LazyVim](https://github.com/LazyVim/LazyVim).
Lazy vim starter refer to the [documentation](https://lazyvim.github.io/installation) to get started.

## 安装

### 前置要求

- Neovim >= 0.9.0（你需要使用 0.11.3）
- Git >= 2.19.0（用于 clone 和部分插件）
- 可选 but 推荐：[Nerd Font](https://www.nerdfonts.com/)（用于图标显示）
- 可选：[ripgrep](https://github.com/BurntSushi/ripgrep)（用于 Telescope 等搜索功能）
- 可选：[fd](https://github.com/sharkdp/fd)（更快的文件查找）

### Windows 安装步骤

1. **备份现有配置**（如有需要）：

```powershell
# 在 PowerShell 中执行
Move-Item $env:LOCALAPPDATA\nvim $env:LOCALAPPDATA\nvim.bak
# 可选：备份本地数据
Move-Item $env:LOCALAPPDATA\nvim-data $env:LOCALAPPDATA\nvim-data.bak
```

2. **Clone 本仓库**：

```powershell
git clone https://github.com/winoli/L-Frame.git
```

3. **启动 Neovim**：

```powershell
nvim
```

第一次启动时会自动下载 lazy.nvim 并安装所有插件。

4. **安装 Treesitter 语法**（可选）：
启动后在 Neovim 内执行：
```
:TSInstallSync
```

# custom content

+ vscode适配，禁用vscode中不用的插件

+ ai插件适配，使用codecompanion作为ai插件
``` json
{
  // 模型配置 json
  // 路径 lua/config/aiKey.json
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
```
