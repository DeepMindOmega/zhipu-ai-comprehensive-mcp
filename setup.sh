#!/bin/bash

# 智谱AI MCP服务器一键安装脚本

echo "智谱AI MCP服务器一键安装脚本"
echo "==========================="

# 检查Python环境
if ! command -v python3 &> /dev/null; then
    echo "错误: 未找到python3"
    exit 1
fi

echo "检查并安装依赖..."

# 检查并安装所有必需的依赖
ALL_DEPS=("zhipuai" "aiohttp" "beautifulsoup4" "sniffio" "httpx" "anyio" "typing-extensions")

MISSING_DEPS=()

for dep in "${ALL_DEPS[@]}"; do
    # 将连字符转换为下划线进行Python导入测试
    dep_import=$(echo "$dep" | sed 's/-/_/g')
    if ! python3 -c "import $dep_import" &> /dev/null; then
        MISSING_DEPS+=("$dep")
    fi
done

if [ ${#MISSING_DEPS[@]} -ne 0 ]; then
    echo "安装缺失的依赖: ${MISSING_DEPS[@]}"
    pip3 install "${MISSING_DEPS[@]}"
else
    echo "所有依赖已安装"
fi

# 额外检查一些复杂的依赖
echo "验证复杂依赖..."
if ! python3 -c "import zhipuai.core._utils._utils" &> /dev/null; then
    echo "安装额外依赖以支持zhipuai..."
    pip3 install sniffio anyio httpx
fi

echo ""
echo "安装完成!"
echo ""
echo "接下来的步骤:"
echo "1. 编辑配置文件 zhipu_comprehensive_config.json 设置API密钥"
echo "2. 运行 ./start_zhipu_comprehensive.sh 启动服务器"
echo "3. 或者查看 README.md 获取更多使用信息"
echo ""
echo "服务器将在 http://localhost:8000 上运行"