FROM node:18

# 設定初始工作目錄
WORKDIR /app

# 複製整個 repo（這步是關鍵）
COPY . .

# 切換工作目錄到 CLI 套件
WORKDIR /app/packages/cli

# 安裝依賴
RUN npm install --legacy-peer-deps

# 建構專案
RUN npm run build

# 曝露埠口
EXPOSE 5678

# 執行 n8n
CMD ["n8n"]
