# 使用 Node LTS 作為基底映像
FROM node:18

# 建立工作目錄
WORKDIR /app

# 複製整個 repo（這一步非常關鍵）
COPY . .

# 切換到 n8n CLI 的子目錄
WORKDIR /app/packages/cli

# ✅ 強制設定正確的 npm registry，避免 "catalog" 錯誤
RUN npm config set registry https://registry.npmjs.org/

# 安裝所有依賴
RUN npm install --legacy-peer-deps

# 編譯 n8n 專案
RUN npm run build

# 開放埠口
EXPOSE 5678

# 啟動 n8n
CMD ["n8n"]
