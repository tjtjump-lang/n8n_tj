FROM node:18

# 設定工作資料夾
WORKDIR /data

# 複製整個 repo 內容（這裡是關鍵！）
COPY . .

# 安裝依賴
RUN npm install --legacy-peer-deps

# 建構專案
RUN npm run build

# 執行 n8n
CMD ["n8n"]
