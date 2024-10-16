###
# Use Node.js
FROM node:20.22.1-bookworm-slim AS base
WORKDIR /app

# Installs
RUN apt-get -y upgrade && apt-get update -qq && \
  apt-get install -y --no-install-recommends \
  vim \
  curl \
  ncdu \
  htop \
  tree \
  lsof \
  tzdata \
  locales-all \
  fish \
  dnsutils && \
  echo "export LANG=ja_JP.UTF-8" >> ~/.bashrc
RUN npm install -g pnpm@9.12.1
RUN pnpm config set store-dir /root/.local/share/pnpm/store
COPY package*.json pnpm-lock.yaml .npmrc ./
RUN pnpm install --frozen-lockfile

