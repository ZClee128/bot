# Moltbot AI Assistant - GitHub Codespaces Edition

<div align="center">

🤖 **个人 AI 助手** - 在 GitHub Codespaces 上运行

支持 WhatsApp、Telegram、Discord 等多个聊天平台

[快速开始](#快速开始) • [文档](MOLTBOT_SETUP.md) • [官方网站](https://clawd.bot/)

</div>

---

## ✨ 特性

- 🚀 **一键部署**: 使用 GitHub Codespaces 快速启动
- 🤖 **多 AI 支持**: Google Gemini、Claude、GPT
- 💬 **全平台**: WhatsApp、Telegram、Discord、Slack 等
- 🧠 **持久记忆**: AI 会记住您的偏好和上下文
- 🌐 **浏览器控制**: 可以浏览网页、填写表单
- 💻 **系统访问**: 可以读写文件、执行命令
- 🔌 **可扩展**: 支持技能插件系统

## 🚀 快速开始

### 1. 部署到 Codespace

点击下方按钮在 GitHub Codespaces 中打开：

[![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://github.com/codespaces/new)

或者手动操作：
1. Fork 这个仓库
2. 点击 **Code** → **Codespaces** → **Create codespace on main**
3. 等待环境自动配置（约 2-3 分钟）

### 2. 配置 API 密钥

```bash
# 复制环境模板
cp .env.template .env

# 编辑并添加您的 Google API 密钥
code .env
```

**获取 Google API 密钥**: https://aistudio.google.com/app/apikey

### 3. 启动 Moltbot

```bash
./start-moltbot.sh
```

按照向导提示完成配置即可！

## 📖 详细文档

查看 [MOLTBOT_SETUP.md](MOLTBOT_SETUP.md) 获取：

- 完整配置指南
- 所有聊天平台连接教程
- 常见问题解决
- 高级功能配置

## 🎯 使用场景

- 📧 **邮件管理**: 清理收件箱、发送邮件
- 📅 **日程管理**: 管理日历、设置提醒
- ✈️ **旅行助手**: 航班值机、行程规划
- 🔍 **信息搜索**: 网页搜索、数据提取
- 💼 **自动化工作**: 文件处理、脚本执行
- 🤝 **团队协作**: 群聊助手、会议总结

## 🛠️ 技术栈

- **运行时**: Node.js 22+
- **AI Providers**: Google Gemini (推荐)、Anthropic Claude、OpenAI
- **聊天协议**: WhatsApp (whatsapp-web.js)、Telegram、Discord
- **部署平台**: GitHub Codespaces

## 📋 环境要求

- Node.js >= 22
- Google/Anthropic/OpenAI API 密钥
- (可选) Brave Search API 密钥用于网络搜索

## 🔒 隐私与安全

- ✅ 所有数据在您的 Codespace 中运行
- ✅ API 密钥存储在环境变量中
- ✅ 不会向第三方发送数据（除了 AI API 调用）
- ✅ 聊天历史和记忆都在本地存储

## 📚 更多资源

- 📖 [官方文档](https://docs.molt.bot/)
- 💻 [GitHub 仓库](https://github.com/moltbot/moltbot)
- 🎨 [技能市场](https://molthub.ai/)
- 💬 [社区讨论](https://github.com/moltbot/moltbot/discussions)

## 🤝 贡献

欢迎提交 Issue 和 Pull Request！

## 📄 许可

本部署配置采用 MIT 许可。Moltbot 本身是开源项目，详见 [官方仓库](https://github.com/moltbot/moltbot)。

---

<div align="center">

**Made with ❤️ for GitHub Codespaces**

如有问题，请查看 [MOLTBOT_SETUP.md](MOLTBOT_SETUP.md) 或提交 Issue

</div>
