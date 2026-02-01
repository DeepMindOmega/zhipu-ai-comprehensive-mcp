# 智谱AI Comprehensive MCP 服务器

这是一个综合性的Model Context Protocol (MCP) 服务器，提供多种基于智谱AI的AI能力，包括文本生成、网络搜索、网页分析、仓库分析等功能。

## 功能特性

- **文本生成** - 使用智谱GLM-4模型生成高质量文本
- **网络搜索** - 智能搜索和总结网络信息
- **网页读取** - 提取和分析网页内容，支持AI摘要
- **仓库分析** - 分析GitHub/GitLab仓库结构和README
- **视觉理解** - 图像分析和理解能力
- **智能降级** - 在没有API密钥时提供基础功能

## 安全特性

- 敏感配置信息通过 `.gitignore` 排除
- 支持配置文件和环境变量两种API密钥管理方式
- 明确的错误提示，区分需要API密钥的功能

## 安装与配置

### 快速安装

```bash
git clone <repository-url>
cd zhipu-ai-comprehensive-mcp
./setup.sh
```

### 手动配置

1. 安装依赖：
   ```bash
   pip3 install zhipuai aiohttp beautifulsoup4
   ```

2. 配置API密钥：
   ```bash
   cp config.template.json zhipu_comprehensive_config.json
   # 编辑 zhipu_comprehensive_config.json 文件，填入您的API密钥
   ```

## 启动服务器

```bash
python3 zhipu_comprehensive_mcp_enhanced.py
```

服务器将在 `http://localhost:8000` 上启动。

## API端点

- `GET /capabilities` - 查询服务器能力
- `POST /execute` - 执行AI功能

### 示例调用

```bash
# 查询能力
curl http://localhost:8000/capabilities

# 文本生成
curl -X POST http://localhost:8000/execute \
  -H "Content-Type: application/json" \
  -d '{
    "tool": "text_generator",
    "params": {
      "prompt": "写一段简短的欢迎词",
      "model": "glm-4"
    }
  }'

# 网页分析
curl -X POST http://localhost:8000/execute \
  -H "Content-Type: application/json" \
  -d '{
    "tool": "web_reader",
    "params": {
      "url": "https://www.example.com",
      "summary": true
    }
  }'
```

## 工具列表

- `web_search` - 智谱AI联网搜索工具
- `web_reader` - 网页内容读取工具（无需API密钥，摘要功能需要API密钥）
- `repo_analyzer` - 开源仓库分析工具
- `vision_analyzer` - 图像分析工具
- `text_generator` - 文本生成功能

## 环境变量

- `ZHIPU_API_KEY` - 智谱AI API密钥（可选，配置文件优先）

## 安全注意事项

- 请勿在代码中硬编码API密钥
- 定期轮换API密钥
- 确保配置文件不被提交到版本控制
- 使用HTTPS保护网络通信