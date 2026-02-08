# 💤 LazyVim

A custom starter for [LazyVim](https://github.com/LazyVim/LazyVim).
Lazy vim starter refer to the [documentation](https://lazyvim.github.io/installation) to get started.

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
