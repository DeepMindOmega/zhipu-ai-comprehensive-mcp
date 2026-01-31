# 智谱AI Comprehensive MCP Server

这是一个功能全面的智谱AI MCP（Model Context Protocol）服务器，集成了多种AI能力。

## 项目特性

### 功能特性
- **联网搜索**: 智谱AI驱动的智能搜索功能
- **网页读取**: 自动抓取和分析网页内容
- **开源仓库分析**: 分析GitHub/GitLab仓库结构和内容
- **视觉理解**: 图像分析和理解能力
- **文本生成**: 基于GLM-4模型的文本生成
- **符合MCP规范**: 遵循标准的Model Context Protocol

### 支持的工具
- `web_search`: 联网搜索
- `web_reader`: 网页读取
- `repo_analyzer`: 开源仓库分析
- `vision_analyzer`: 视觉理解
- `text_generator`: 文本生成

## 安装和使用

### 1. 安装依赖
有两种方式安装依赖：
- 方式一：直接运行安装脚本（推荐）
```bash
./setup.sh
```

- 方式二：手动安装依赖
```bash
pip install zhipuai aiohttp beautifulsoup4 sniffio httpx anyio
```

### 2. 配置API密钥
编辑 `zhipu_comprehensive_config.json` 文件，将 `YOUR_ZHIPU_API_KEY_HERE` 替换为您的实际API密钥

### 3. 启动服务器
```bash
./start_zhipu_comprehensive.sh
```

### 4. 测试功能
```bash
./test_comprehensive_mcp.py
```

## API使用示例

### 联网搜索
```bash
curl -X POST http://localhost:8000/execute \
  -H "Content-Type: application/json" \
  -d '{
    "tool": "web_search",
    "params": {
      "query": "人工智能最新发展",
      "max_results": 5
    }
  }'
```

### 网页读取
```bash
curl -X POST http://localhost:8000/execute \
  -H "Content-Type: application/json" \
  -d '{
    "tool": "web_reader",
    "params": {
      "url": "https://example.com/article",
      "summary": true
    }
  }'
```

## 配置文件

配置文件包含以下设置：
- 服务器配置（主机、端口、调试模式）
- 智谱AI API配置（API密钥、默认模型、超时设置）
- MCP服务配置（名称、版本、描述）
- 功能开关（启用/禁用特定功能）

## 项目结构

```
zhipu/
├── zhipu_comprehensive_mcp.py          # 主服务器实现（综合性）
├── zhipu_comprehensive_config.json     # 配置文件（综合性）
├── zhipu_vision_mcp.py                 # 视觉模型专用服务器
├── zhipu_vision_config.json            # 视觉模型配置文件
├── start_zhipu_comprehensive.sh        # 综合性服务器启动脚本
├── start_zhipu_vision.sh               # 视觉模型服务器启动脚本
├── test_comprehensive_mcp.py           # 综合性服务器测试脚本
├── test_zhipu_vision.py                # 视觉模型服务器测试脚本
├── setup.sh                            # 一键安装脚本
├── README.md                           # 项目说明
├── ZHIPU_COMPREHENSIVE_MCP_README.md   # 综合性服务器详细文档
├── ZHIPU_VISION_MCP_README.md          # 视觉模型服务器文档
├── ZHIPU_PROJECT_SUMMARY.md            # 项目概述
└── ZHIPU_INSTALLATION_GUIDE.md         # 安装指南
```

## 贡献

欢迎提交Issue和Pull Request来改进这个项目。

## 许可证

请参阅 LICENSE 文件了解使用条款。

---

要将此项目发布到GitHub，请执行以下步骤：

1. 创建一个新的GitHub仓库
2. 将本地仓库连接到远程仓库：
   ```bash
   git remote add origin https://github.com/YOUR_USERNAME/YOUR_REPO_NAME.git
   ```
3. 推送代码：
   ```bash
   git branch -M main
   git push -u origin main
   ```