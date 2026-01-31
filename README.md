# 智谱AI Comprehensive MCP Server

这是一个功能全面的智谱AI MCP（Model Context Protocol）服务器，集成了多种AI能力。

## 项目结构

```
zhipu/
├── zhipu_comprehensive_mcp.py          # 主服务器实现（综合性）
├── zhipu_comprehensive_config.json     # 配置文件（综合性，在此配置API Key）
├── start_zhipu_comprehensive.sh        # 启动脚本（综合性）
├── test_comprehensive_mcp.py           # 测试脚本（综合性）
├── zhipu_vision_mcp.py                 # 视觉模型专用服务器
├── zhipu_vision_config.json            # 视觉模型配置文件
├── start_zhipu_vision.sh               # 视觉模型启动脚本
├── test_zhipu_vision.py                # 视觉模型测试脚本
├── ZHIPU_COMPREHENSIVE_MCP_README.md   # 综合性服务器详细使用说明
├── ZHIPU_VISION_MCP_README.md          # 视觉模型服务器使用说明
├── ZHIPU_PROJECT_SUMMARY.md            # 项目概述
├── ZHIPU_INSTALLATION_GUIDE.md         # 安装指南
└── README.md                           # 本文件
```

## API Key 配置

配置文件路径：`zhipu_comprehensive_config.json` （综合性服务）或 `zhipu_vision_config.json` （视觉模型服务）

配置内容：
```json
{
  "server": {
    "host": "localhost",
    "port": 8000,
    "debug": false
  },
  "zhipu": {
    "api_key": "YOUR_ZHIPU_API_KEY_HERE",  // ← 在这里替换为您的API密钥
    "default_model": "glm-4",
    "timeout": 30
  },
  ...
}
```

## 安装和使用

### 1. 安装依赖
```bash
pip install zhipuai aiohttp beautifulsoup4
```

### 2. 配置API密钥
编辑配置文件，将 `YOUR_ZHIPU_API_KEY_HERE` 替换为您的实际API密钥

### 3. 启动服务器

#### 综合性服务器（推荐）
```bash
./start_zhipu_comprehensive.sh
```

#### 仅视觉模型服务器
```bash
./start_zhipu_vision.sh
```

### 4. 测试功能

#### 综合性服务器测试
```bash
./test_comprehensive_mcp.py
```

#### 视觉模型服务器测试
```bash
./test_zhipu_vision.py
```

## 功能特性

### 综合性服务器功能
- **联网搜索**: 智谱AI驱动的智能搜索功能
- **网页读取**: 自动抓取和分析网页内容
- **开源仓库分析**: 分析GitHub/GitLab仓库结构和内容
- **视觉理解**: 图像分析和理解能力
- **文本生成**: 基于GLM-4模型的文本生成
- **符合MCP规范**: 遵循标准的Model Context Protocol

### 视觉模型服务器功能
- **图像分析**: 智能图像内容分析
- **物体识别**: 识别图像中的物体
- **场景理解**: 理解图像场景上下文
- **文字提取**: 从图像中提取文字内容

## 服务器信息

### 综合性服务器
- 服务器地址: http://localhost:8000
- 能力查询: GET http://localhost:8000/capabilities
- 执行接口: POST http://localhost:8000/execute

### 视觉模型服务器
- 服务器地址: http://localhost:8000
- 能力查询: GET http://localhost:8000/capabilities
- 执行接口: POST http://localhost:8000/execute

## 支持的工具（综合性服务器）

- `web_search`: 联网搜索
- `web_reader`: 网页读取
- `repo_analyzer`: 开源仓库分析
- `vision_analyzer`: 视觉理解
- `text_generator`: 文本生成