# Moltbot GitHub Codespaces 部署指南

本指南将帮助您在 GitHub Codespaces 上部署和运行 Moltbot AI 助手。

## 📋 目录

- [快速开始](#快速开始)
- [配置 API 密钥](#配置-api-密钥)
- [连接聊天平台](#连接聊天平台)
- [常见问题](#常见问题)
- [高级配置](#高级配置)

---

## 🚀 快速开始

### 1. 创建 Codespace

1. 将此项目推送到 GitHub 仓库
2. 点击仓库页面的 **Code** → **Codespaces** → **Create codespace on main**
3. 等待 2-3 分钟，Codespace 会自动配置环境

### 2. 配置环境变量

Codespace 启动后：

```bash
# 复制环境变量模板
cp .env.template .env

# 编辑 .env 文件
code .env
```

**最少配置**：在 `.env` 中设置您的 Google API 密钥：

```bash
GOOGLE_API_KEY=your_actual_api_key_here
```

> 💡 **获取 Google API 密钥**: 访问 https://aistudio.google.com/app/apikey

### 3. 启动 Moltbot

```bash
./start-moltbot.sh
```

首次运行会启动配置向导，按提示操作：
- 选择 **Local Gateway**
- 选择 **Google/Gemini** 作为 AI provider
- 选择您想使用的聊天平台（建议从 Telegram 开始）

---

## 🔑 配置 API 密钥

### Google Gemini (推荐)

1. 访问 [Google AI Studio](https://aistudio.google.com/app/apikey)
2. 点击 **Create API Key**
3. 复制密钥并粘贴到 `.env` 文件的 `GOOGLE_API_KEY`

**优势**：
- 免费额度高
- 响应速度快
- 支持最新的 Gemini 2.0 模型

### 其他 AI Providers（可选）

如果您想使用其他 AI 服务：

**Anthropic Claude**:
- 获取地址: https://console.anthropic.com/
- 配置: `ANTHROPIC_API_KEY=sk-ant-...`

**OpenAI**:
- 获取地址: https://platform.openai.com/api-keys
- 配置: `OPENAI_API_KEY=sk-...`

### Web 搜索（可选但推荐）

为了让 Moltbot 能够搜索网络信息：

1. 访问 [Brave Search API](https://brave.com/search/api/)
2. 注册并获取 API 密钥
3. 在 `.env` 中设置: `BRAVE_SEARCH_API_KEY=your_key`

---

## 💬 连接聊天平台

### Telegram (最简单，推荐新手)

1. **创建 Telegram Bot**：
   - 在 Telegram 中搜索 [@BotFather](https://t.me/BotFather)
   - 发送 `/newbot` 命令
   - 按提示设置 bot 名称和用户名
   - 复制 BotFather 给你的 token

2. **配置 Moltbot**：
   ```bash
   moltbot configure --section providers
   ```
   - 选择 Telegram
   - 粘贴您的 bot token

3. **测试连接**：
   - 在 Telegram 中搜索您的 bot
   - 发送 `/start` 或任何消息
   - Moltbot 应该会回复！

### WhatsApp (需要扫码)

1. **启动配置**：
   ```bash
   moltbot configure --section providers
   ```
   选择 WhatsApp

2. **扫描二维码**：
   - 终端会显示一个二维码
   - 打开 WhatsApp → 设置 → 已连接的设备 → 连接设备
   - 扫描终端中的二维码

3. **开始使用**：
   - 在 WhatsApp 中给自己发消息测试
   - 或创建一个群组并 @ 您的号码

### Discord

1. **创建 Discord Bot**：
   - 访问 [Discord Developer Portal](https://discord.com/developers/applications)
   - 创建 New Application
   - 在 Bot 标签页创建 bot 并复制 token
   - 在 OAuth2 → URL Generator 中选择 bot 权限并邀请到服务器

2. **配置 Moltbot**：
   ```bash
   moltbot configure --section providers
   ```
   - 选择 Discord
   - 粘贴 bot token

3. **使用**：
   - 在 Discord 频道中 @您的bot 或发送 DM

---

## ❓ 常见问题

### Codespace 中无法扫描 WhatsApp 二维码？

WhatsApp 的二维码会在终端显示为文本格式。您可以：

1. **方法一**：使用在线二维码生成器
   - 复制终端中显示的文本
   - 访问 https://www.qr-code-generator.com/
   - 粘贴文本并生成二维码
   - 用 WhatsApp 扫描生成的二维码

2. **方法二**：使用 Telegram 代替
   - Telegram 不需要二维码，配置更简单

### Moltbot 不响应我的消息？

检查清单：

```bash
# 1. 检查 Moltbot 是否运行
moltbot status

# 2. 查看日志
moltbot logs

# 3. 重启服务
moltbot restart
```

### 如何更换 AI 模型？

在 `.env` 中设置：

```bash
# Gemini 模型
MOLTBOT_MODEL=gemini-2.0-flash-exp    # 最快
MOLTBOT_MODEL=gemini-2.0-pro          # 最强
MOLTBOT_MODEL=gemini-1.5-pro          # 稳定

# Claude 模型
MOLTBOT_MODEL=claude-3-5-sonnet-20241022

# OpenAI 模型
MOLTBOT_MODEL=gpt-4o
MOLTBOT_MODEL=gpt-4o-mini
```

然后重启 Moltbot：
```bash
moltbot restart
```

### 如何在后台运行？

Codespaces 中，使用：

```bash
# 启动为后台服务
moltbot start --daemon

# 查看状态
moltbot status

# 查看日志
moltbot logs --follow

# 停止
moltbot stop
```

### 数据存储在哪里？

- 配置文件: `~/.clawdbot/`
- 数据文件: `.moltbot-data/` (在项目目录中)
- 环境变量: `.env` (不会提交到 Git)

---

## 🔧 高级配置

### 自定义端口

在 `.env` 中：
```bash
MOLTBOT_PORT=8080
```

然后在 `.devcontainer/devcontainer.json` 中更新 `forwardPorts`。

### 配置技能（Skills）

Moltbot 支持自定义技能扩展：

```bash
# 浏览可用技能
moltbot skills browse

# 安装技能
moltbot skills install <skill-name>

# 查看已安装技能
moltbot skills list
```

技能文档: https://docs.molt.bot/skills

### 配置系统权限

Moltbot 可以访问文件系统和运行命令。配置权限级别：

```bash
moltbot configure --section permissions
```

选项：
- **Full access**: Moltbot 可以执行任何命令（谨慎使用）
- **Sandboxed**: 限制在特定目录（推荐）
- **Read-only**: 只能读取文件

### 多用户配置

如果您想为不同用户创建不同的 Moltbot 实例：

```bash
# 创建新的 agent
moltbot agent create --profile work

# 切换 agent
moltbot agent use work
```

---

## 📚 更多资源

- **官方文档**: https://docs.molt.bot/
- **GitHub 仓库**: https://github.com/moltbot/moltbot
- **技能市场**: https://molthub.ai/
- **社区支持**: GitHub Discussions

---

## 🎯 快速命令参考

```bash
# 状态管理
moltbot start              # 启动服务
moltbot stop               # 停止服务
moltbot restart            # 重启服务
moltbot status             # 查看状态

# 配置
moltbot configure          # 配置向导
moltbot onboard            # 重新运行初始化向导

# 日志
moltbot logs               # 查看日志
moltbot logs --follow      # 实时查看日志

# 信息
moltbot --version          # 查看版本
moltbot --help             # 查看帮助
```

---

## 🤝 需要帮助？

如果您遇到任何问题：

1. 查看日志: `moltbot logs`
2. 检查配置: `moltbot configure --show`
3. 重新初始化: `moltbot onboard --force`
4. 查看官方文档: https://docs.molt.bot/

祝您使用愉快！🎉
