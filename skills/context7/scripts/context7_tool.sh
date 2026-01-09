#!/bin/bash

# ==============================================================================
# Context7 API Client (V2 Strict Version)
# Fixed: Correct parameter names based on validation error
# ==============================================================================

# 1. 基础环境检查
if ! command -v jq &> /dev/null; then
    echo "Error: 'jq' is not installed."
    exit 1
fi

# 2. 网络配置 (保持 SSL/代理 修复)
CURL_OPTS="-G -s -k -L --proxy-insecure"

# 3. 接口地址 (V2)
SEARCH_URL="https://context7.com/api/v2/libs/search"
CONTEXT_URL="https://context7.com/api/v2/context"
CONTEXT7_API_KEY="<your context7 api key>"
COMMAND=$1
ARG1=$2
ARG2=$3

# 4. 执行逻辑
if [ "$COMMAND" == "search" ]; then
    # -----------------------------------------------------
    # Endpoint: /libs/search
    # Correct Param: libraryName (Required)
    # -----------------------------------------------------
    curl $CURL_OPTS "$SEARCH_URL" \
      -H "Authorization: Bearer $CONTEXT7_API_KEY" \
      --data-urlencode "libraryName=$ARG1"

elif [ "$COMMAND" == "context" ]; then
    # -----------------------------------------------------
    # Endpoint: /context
    # Correct Params:
    #   - libraryId (Required)
    #   - query (Required)
    # -----------------------------------------------------

    if [ -z "$ARG2" ]; then
        echo "Error: context command requires libraryId and query."
        echo "Example: $0 context /vercel/next.js \"middleware usage\""
        exit 1
    fi

    # 注意：ARG1 是 libraryId (例如 /vercel/next.js)
    # ARG2 是具体的查询问题
    curl $CURL_OPTS "$CONTEXT_URL" \
      -H "Authorization: Bearer $CONTEXT7_API_KEY" \
      --data-urlencode "libraryId=$ARG1" \
      --data-urlencode "query=$ARG2"

else
    echo "Usage:"
    echo "  $0 search <name>"
    echo "  $0 context <libraryId> <question>"
    exit 1
fi
