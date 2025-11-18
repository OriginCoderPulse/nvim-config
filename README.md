# Neovim 配置文档

一个现代化的 Neovim 配置，采用模块化设计，集成了 AI 代码助手、LSP、Tree-sitter 等强大功能。

## 📋 目录

- [特性](#特性)
- [安装要求](#安装要求)
- [快速开始](#快速开始)
- [配置结构](#配置结构)
- [插件列表](#插件列表)
- [快捷键](#快捷键)
- [LSP 支持](#lsp-支持)
- [AI 代码助手](#ai-代码助手)
- [自定义配置](#自定义配置)
- [故障排除](#故障排除)

## ✨ 特性

- 🚀 **模块化架构**：采用模块化设计，易于维护和扩展
- 🎨 **现代化 UI**：集成多种 UI 增强插件，提供流畅的编辑体验
- 🤖 **AI 代码助手**：集成 DeepSeek AI 代码助手，支持代码解释、修复、优化
- 🔧 **完整 LSP 支持**：支持 11+ 种编程语言的 LSP 服务器
- 📁 **强大文件管理**：文件浏览器、模糊搜索、快速跳转
- 📝 **自动格式化**：支持多种语言的代码格式化
- 🌈 **语法高亮**：基于 Tree-sitter 的语法高亮和代码分析
- 🔍 **模糊搜索**：强大的文件、内容搜索功能
- ⚡ **懒加载**：智能懒加载机制，提升启动速度

## 📋 安装要求

### 系统要求

- **Neovim**: 0.9.0 或更高版本
- **Git**: 用于插件管理
- **Node.js**: 用于 LSP 服务器（推荐 v18+）
- **Python**: 用于某些插件（推荐 v3.8+）

### 依赖工具安装

```bash
# macOS (使用 Homebrew)
brew install neovim git node python

# Ubuntu/Debian
sudo apt update
sudo apt install neovim git nodejs npm python3

# CentOS/RHEL
sudo yum install neovim git nodejs npm python3

# Arch Linux
sudo pacman -S neovim git nodejs npm python
```

## 🚀 快速开始

### 1. 克隆配置

```bash
git clone <your-repo-url> ~/.config/nvim
cd ~/.config/nvim
```

### 2. 启动 Neovim

启动 Neovim 后，插件会自动安装：

```bash
nvim
```

首次启动可能需要几分钟来下载和安装插件。

### 3. 安装 LSP 服务器

使用 Mason 安装语言服务器：

```vim
:Mason
```

在 Mason 界面中，按 `i` 安装所需的语言服务器。

### 4. 安装 Tree-sitter 解析器

```vim
:TSInstall all
```

或者安装特定语言的解析器：

```vim
:TSInstall lua python javascript typescript
```

### 5. 配置 AI 助手（可选）

设置 DeepSeek API Key：

```bash
export DEEPSEEK_API_KEY="your-api-key"
```

或者添加到 `~/.zshrc` 或 `~/.bashrc`：

```bash
echo 'export DEEPSEEK_API_KEY="your-api-key"' >> ~/.zshrc
```

## 📁 配置结构

```
~/.config/nvim/
├── init.lua                          # 主配置文件，模块加载入口
├── lua/
│   ├── configs/                      # 基础配置
│   │   ├── custom.lua                # 全局设置（主题、选项等）
│   │   ├── keymaps.lua               # 快捷键配置
│   │   └── commands.lua               # 自动命令和事件处理
│   └── util/
│       ├── package-configs/           # 插件配置
│       │   ├── telescope.lua          # 文件搜索
│       │   ├── tree-sitter.lua        # 语法高亮
│       │   ├── lsp.lua                # LSP 配置
│       │   ├── code-companion.lua     # AI 助手
│       │   └── ...                    # 其他插件配置
│       ├── lsp-configs/               # LSP 相关配置
│       │   ├── mason/                 # Mason 配置
│       │   ├── snips/                 # 代码片段
│       │   └── lsp-configure.lua      # LSP 通用配置
│       └── code-companion/            # AI 助手提示词
│           └── prompts/
│               ├── action/            # 操作提示词
│               └── system/           # 系统提示词
└── lsp/                               # LSP 服务器配置
    ├── lua_ls.lua
    ├── ts_ls.lua
    └── ...
```

## 🔌 插件列表

### 核心插件

| 插件                  | 功能       | 状态 |
| --------------------- | ---------- | ---- |
| **super-installer**   | 插件管理器 | ✅   |
| **lualine**           | 状态栏     | ✅   |
| **nvim-tree**         | 文件浏览器 | ✅   |
| **telescope**         | 模糊搜索   | ✅   |
| **nvim-web-devicons** | 文件图标   | ✅   |

### 开发工具

| 插件                | 功能       | 状态 |
| ------------------- | ---------- | ---- |
| **nvim-treesitter** | 语法高亮   | ✅   |
| **mason**           | LSP 管理器 | ✅   |
| **nvim-lspconfig**  | LSP 配置   | ✅   |
| **nvim-cmp**        | 代码补全   | ✅   |
| **luasnip**         | 代码片段   | ✅   |

### 增强功能

| 插件               | 功能        | 状态 |
| ------------------ | ----------- | ---- |
| **codecompanion**  | AI 代码助手 | ✅   |
| **formatter**      | 代码格式化  | ✅   |
| **Comment.nvim**   | 注释工具    | ✅   |
| **nvim-autopairs** | 自动配对    | ✅   |
| **hop.nvim**       | 快速跳转    | ✅   |

### UI 增强

| 插件                | 功能          | 状态      |
| ------------------- | ------------- | --------- |
| **noice**           | 命令界面      | ⚠️ 已禁用 |
| **notify**          | 通知系统      | ✅        |
| **transparent**     | 透明背景      | ✅        |
| **snacks**          | 通知美化      | ✅        |
| **render-markdown** | Markdown 渲染 | ✅        |

## ⌨️ 快捷键

### 基础导航

- `<Leader>w` - 切换窗口
- `<Leader>b` - 返回上一个位置
- `<Leader>q` - 退出
- `<Leader><S-q>` - 强制退出

### 文件操作

- `<Leader>e` - 打开/关闭文件浏览器
- `<Leader>ff` - 文件搜索
- `<Leader>fo` - 最近文件
- `<Leader>fl` - 实时搜索（Live Grep）

### 代码操作

- `<Leader>ga` - 接受 AI 建议
- `<Leader>gr` - 拒绝 AI 建议
- `<Leader>ft` - 打开浮动终端
- `<Leader>i` - 安装插件（Super Installer）
- `<Leader>u` - 更新插件
- `<Leader>r` - 移除插件

### LSP 操作

- `gd` - 跳转到定义
- `gr` - 查找引用
- `K` - 显示文档（悬浮窗）
- `<Leader>ca` - 代码操作
- `<Leader>rn` - 重命名符号
- `<Leader>f` - 格式化代码

### 其他快捷键

- `<Leader>h` - Hop 快速跳转
- `gcc` - 注释/取消注释当前行
- `gc` - 注释选中区域（Visual 模式）

## 🔧 LSP 支持

### 支持的语言

| 语言           | LSP 服务器 | 配置文件         | 状态 |
| -------------- | ---------- | ---------------- | ---- |
| **Lua**        | lua_ls     | `lsp/lua_ls.lua` | ✅   |
| **JavaScript** | ts_ls      | `lsp/ts_ls.lua`  | ✅   |
| **TypeScript** | ts_ls      | `lsp/ts_ls.lua`  | ✅   |
| **Python**     | pylsp      | `lsp/pylsp.lua`  | ✅   |
| **Java**       | jdtls      | `lsp/jdtls.lua`  | ✅   |
| **C/C++**      | clangd     | `lsp/clangd.lua` | ✅   |
| **HTML**       | html       | `lsp/html.lua`   | ✅   |
| **Go**         | Go         | `lsp/gopls.lua`  | ✅   |
| **CSS**        | cssls      | `lsp/cssls.lua`  | ✅   |
| **JSON**       | jsonls     | `lsp/jsonls.lua` | ✅   |
| **Bash**       | bashls     | `lsp/bashls.lua` | ✅   |

### LSP 功能

- ✅ 代码补全
- ✅ 跳转到定义
- ✅ 查找引用
- ✅ 悬停文档
- ✅ 代码操作
- ✅ 符号重命名
- ✅ 诊断信息
- ✅ 代码格式化

### 安装 LSP 服务器

1. 打开 Mason：`:Mason`
2. 使用 `i` 键安装所需的语言服务器
3. 使用 `X` 键卸载服务器
4. 使用 `?` 查看帮助

## 🤖 AI 代码助手

### DeepSeek 集成

本配置集成了 **DeepSeek AI** 代码助手，支持以下功能：

- 📝 **代码解释**：解释代码的功能和逻辑
- 🔧 **代码修复**：自动修复代码错误
- ⚡ **代码优化**：优化代码性能和可读性
- 💬 **代码对话**：与 AI 进行代码相关的对话

### 配置步骤

1. **获取 API Key**

   访问 [DeepSeek Platform](https://platform.deepseek.com/) 获取 API Key

2. **设置环境变量**

   ```bash
   export DEEPSEEK_API_KEY="your-api-key"
   ```

   或添加到 shell 配置文件：

   ```bash
   # ~/.zshrc 或 ~/.bashrc
   echo 'export DEEPSEEK_API_KEY="your-api-key"' >> ~/.zshrc
   source ~/.zshrc
   ```

3. **使用 AI 助手**
   - 打开命令面板，选择 AI 操作
   - 使用 `<Leader>ga` 接受 AI 建议
   - 使用 `<Leader>gr` 拒绝 AI 建议

### 自定义提示词

提示词配置文件位于：

- `lua/util/code-companion/prompts/action/` - 操作提示词
  - `explan-code.lua` - 代码解释
  - `fix-code.lua` - 代码修复
  - `optimize-code.lua` - 代码优化
- `lua/util/code-companion/prompts/system/` - 系统提示词
  - `deepseek-v3.lua` - DeepSeek 系统提示

## ⚙️ 自定义配置

### 启用/禁用插件

编辑 `init.lua` 中的 `config_modules` 数组：

```lua
local config_modules = {
    -- 禁用某个插件
    { name = "util.package-configs.noice", enabled = false },

    -- 启用某个插件
    { name = "util.package-configs.telescope", enabled = true },
}
```

### 懒加载配置

某些插件支持懒加载，延迟加载可以提升启动速度：

```lua
{ name = "util.package-configs.tree-sitter", enabled = true, lazy = true }
```

### 自定义快捷键

编辑 `lua/configs/keymaps.lua` 添加或修改快捷键：

```lua
{
    mode = "n",
    key = "your-key",
    leader = true,
    map = ":YourCommand<CR>",
    enabled = true,
    desc = "Description",
}
```

### 自定义全局设置

编辑 `lua/configs/custom.lua` 修改全局选项：

```lua
local custom = {
    { type = "option", attribute = "tabstop", value = 4 },  -- 修改 tab 宽度
    { type = "option", attribute = "number", value = false }, -- 禁用行号
}
```

### 自定义 LSP 配置

编辑 `lsp/` 目录下对应的语言服务器配置文件，例如 `lsp/lua_ls.lua`：

```lua
return {
    settings = {
        Lua = {
            -- 自定义 Lua 配置
        }
    }
}
```

## 🔍 故障排除

### 常见问题

#### 1. 插件安装失败

**问题**：插件无法下载或安装

**解决方案**：

```bash
# 清理插件缓存
rm -rf ~/.local/share/nvim
rm -rf ~/.nvim-utils/package

# 重新启动 Neovim
nvim
```

#### 2. LSP 服务器未启动

**问题**：代码补全或诊断不工作

**解决方案**：

```vim
" 检查 LSP 状态
:LspInfo

" 打开 Mason 安装服务器
:Mason

" 查看 LSP 日志
:LspLog
```

#### 3. Tree-sitter 解析器安装失败

**问题**：语法高亮不正常

**解决方案**：

```vim
" 安装特定解析器
:TSInstall lua

" 更新所有解析器
:TSUpdate

" 检查解析器状态
:TSBufInfo
```

#### 4. AI 助手无法使用

**问题**：DeepSeek 助手不响应

**解决方案**：

1. 检查 API Key 是否正确设置：

   ```bash
   echo $DEEPSEEK_API_KEY
   ```

2. 检查网络连接

3. 查看错误日志：
   ```vim
   :messages
   ```

#### 5. 配置文件加载错误

**问题**：启动时出现错误

**解决方案**：

```vim
" 检查配置健康状态
:checkhealth

" 查看错误消息
:messages

" 检查 Lua 配置
:lua print(vim.inspect(package.loaded))
```

### 调试模式

启用详细日志：

```vim
" 查看所有消息
:messages

" 查看 LSP 日志
:LspLog

" 检查插件状态
:checkhealth

" 查看运行时路径
:echo &runtimepath
```

### 重置配置

如果配置出现问题，可以重置：

```bash
# 备份当前配置
mv ~/.config/nvim ~/.config/nvim.backup

# 清理插件和数据
rm -rf ~/.local/share/nvim
rm -rf ~/.nvim-utils

# 重新克隆配置
git clone <your-repo-url> ~/.config/nvim
```

## 📚 更多资源

### 官方文档

- [Neovim 官方文档](https://neovim.io/doc/)
- [LSP 配置指南](https://github.com/neovim/nvim-lspconfig)
- [Tree-sitter 文档](https://tree-sitter.github.io/tree-sitter/)
- [DeepSeek API 文档](https://platform.deepseek.com/api-docs/)

### 插件文档

- [Telescope](https://github.com/nvim-telescope/telescope.nvim)
- [Mason](https://github.com/williamboman/mason.nvim)
- [Tree-sitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [Code Companion](https://github.com/olimorris/codecompanion.nvim)

### 学习资源

- [Neovim 从入门到精通](https://github.com/rockerBOO/awesome-neovim)
- [Lua 配置指南](https://github.com/nanotee/nvim-lua-guide)

## 🤝 贡献

欢迎提交 Issue 和 Pull Request 来改进这个配置！

### 贡献指南

1. Fork 本仓库
2. 创建特性分支 (`git checkout -b feature/AmazingFeature`)
3. 提交更改 (`git commit -m 'Add some AmazingFeature'`)
4. 推送到分支 (`git push origin feature/AmazingFeature`)
5. 开启 Pull Request

## 📄 许可证

MIT License

---

**注意**：这是一个个人配置，请根据你的需求进行调整。某些插件可能需要额外的系统依赖。
