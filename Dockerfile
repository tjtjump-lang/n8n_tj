FROM node:18

WORKDIR /app

COPY . .

# ✅ 刪除所有可能導致錯誤的 .npmrc
RUN rm -f ~/.npmrc || true && rm -f /app/.npmrc || true && rm -f /app/packages/cli/.npmrc || true

# 切換到 n8n CLI 套件目錄
WORKDIR /app/packages/cli

# ✅ 強制設定正確的 npm registry
RUN npm config set registry https://registry.npmjs.org/

# 安裝依賴
RUN npm install --legacy-peer-deps

# 建構
RUN npm run build

EXPOSE 5678

CMD ["n8n"]
