# 快速部署指南

## 📦 项目结构

```
moltbot-codespaces/
├── .devcontainer/           # Codespaces 配置
│   ├── devcontainer.json   # 容器配置
│   └── setup.sh            # 自动安装脚本
├── .env.template           # 环境变量模板
├── .gitignore              # Git 忽略文件
├── README.md               # 项目说明
├── MOLTBOT_SETUP.md        # 详细设置文档
├── setup-moltbot.sh        # 手动安装脚本
└── start-moltbot.sh        # 启动脚本
```

## 🚀 部署到 GitHub Codespaces

### 第一步：推送到 GitHub

```bash
# 在项目目录中
cd /Users/lizhicong/Desktop/股票/moltbot-codespaces

# 添加所有文件
git add .

# 提交
git commit -m "Initial Moltbot Codespaces setup"

# 在 GitHub 上创建新仓库（访问 github.com/new）
# 然后关联远程仓库
git remote add origin https://github.com/YOUR_USERNAME/moltbot-codespaces.git

# 推送
git push -u origin main
```

### 第二步：创建 Codespace

1. 访问您的 GitHub 仓库
2. 点击绿色的 **Code** 按钮
3. 选择 **Codespaces** 标签
4. 点击 **Create codespace on main**

等待约 2-3 分钟，环境会自动配置完成。

### 第三步：配置 API 密钥

在 Codespace 终端中：

```bash
# 复制环境模板
cp .env.template .env

# 编辑 .env 文件
code .env
```

在 `.env` 文件中填入您的 Google API 密钥：

```bash
GOOGLE_API_KEY=你的实际密钥
```

**获取 Google API 密钥**: https://aistudio.google.com/app/apikey

### 第四步：启动 Moltbot

```bash
./start-moltbot.sh
```

首次运行会启动配置向导：
1. 选择 **Local Gateway**
2. 选择 **Google/Gemini** 作为 AI provider
3. 选择聊天平台（推荐 Telegram）

## 💬 连接 Telegram（最简单）

1. **创建 Bot**：
   - 在 Telegram 搜索 `@BotFather`
   - 发送 `/newbot` 并按提示操作
   - 获得 token

2. **配置 Moltbot**：
   ```bash
   moltbot configure --section providers
   ```
   选择 Telegram 并粘贴 token

3. **测试**：
   在 Telegram 中找到您的 bot，发送消息！

## 📖 完整文档

查看 [MOLTBOT_SETUP.md](MOLTBOT_SETUP.md) 了解：
- WhatsApp、Discord 等其他平台配置
- 常见问题解决
- 高级功能配置

## 🎯 常用命令

```bash
moltbot start           # 启动服务
moltbot stop            # 停止服务
moltbot status          # 查看状态
moltbot logs            # 查看日志
moltbot configure       # 配置设置
```

## ⚠️ 重要提示

1. **不要提交 .env 文件** - 已在 .gitignore 中排除
2. **数据持久化** - `.moltbot-data/` 目录会保存您的配置
3. **Codespace 停止** - 停止 Codespace 后数据仍会保留
4. **API 配额** - 注意您的 Google API 使用配额

祝您使用愉快！🎉
