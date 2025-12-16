# 应许之世 —— 服务端Git存储库

## 一、简介
  本存储库为Minecraft（我的世界）游戏服务器 —— 应许之世的服务端Git存储库，用于服务端的制作以及后续的维护

### 本存储库负责人
  - **涅槃**
    - **游戏ID**：MC_Nirvana
    - **电子邮件**：[mcnirvana@126.com](mailto:mcnirvana@126.com)

### 服务端核心
  - **代理服务端**
    - 核心：Velocity
  - **插件服务端**
    - 核心：Paper
    - 游戏版本：1.21.10
  - **模组服务端**
    - 核心：NeoForge+SpongeNeo
    - 游戏版本：1.21.1

## 二、重要目录与文件列表
  - `/ME-Frp`
    - 介绍：ME Frp配置文件根目录
    - 用途：用于存放Frp客户端的配置文件
  - `/Sub-Server`
    - 介绍：Minecraft服务端文件根目录
    - 用途：用于存放Minecraft服务端所需的各类文件
  - `/Velocity`
    - 介绍：Velocity代理服务端文件根目录
    - 用途：用于存放Velocity代理服务端所需的各类文件
  - `/docker-compose.yml`
    - 介绍：Docker容器编排文件
    - 用途：用于配置Docker容器
  - `/Dockerfile`
    - 介绍：Docker镜像文件
    - 用途：用于构建Docker镜像

## 三、环境与组件

### 运行环境要求：
  - **Java**
    - **要求**：需安装Java21或更高版本
    - **作用**：用于Minecraft服务端的运行

### 前置组件要求：
  - **Docker**
    - **介绍**：一款容器化引擎
    - **作用**：用于容器化运行Minecraft服务器