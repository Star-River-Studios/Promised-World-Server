# 应许之世 —— 服务端Git存储库

## 一、简介
  本存储库为Minecraft（我的世界）游戏服务器 —— 应许之世的服务端Git存储库，用于服务端的制作以及后续的维护

### 服务端基本信息
  - **服务端类型**：群组服（单端模组服）
  - **服务端版本**：1.21.1（Youer&SpongeNeo）&1.21.10（Paper）
  - **服务端核心**：Velocity+Youer+SpongeNeo+Paper

### 本存储库负责人
  - **涅槃**
    - **游戏ID**：MC_Nirvana
    - **联系方式**：[电子邮件](mailto:mcnirvana@126.com)

## 二、重要目录与文件列表
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

## 四、使用方法
- 准备工作
1. 克隆本仓库
```bash
  git clone https://github.com/MC-Nirvana/Promised-World.git
```
2. 补全文件
  - 须知：由于直接提交Libraries目录会导致存储库臃肿，因此SponegNeo服务器（mod-alpha目录）将不保留NeoForge的Libraries目录。需自行补全
  - 补全方法
    1. 前往[NeoForge官网](https://neoforged.net/)下载符合要求的NeoForge核心（具体要求可以看SpongeNeo核心的文件名，以spongeneo-1.21.1-**21.1.211**-12.0.3-RC2401-universal.jar为例，其中的`21.1.211`即为SpongeNeo的NeoForge的最低版本要求。）
    2. 打开终端或连接到服务器
    3. 在保存NeoForge安装文件的目录中输入以下命令
    ```bash
      java -jar "你的NeoForge安装JAR文件" --install-server
    ```
    4. 等待安装完毕
    5. 将安装完成的Libraries目录移动到`Sub-Server/mod-alpha`目录中
3. 进入仓库并启动容器集群
```bash
  cd ./Promised-World
  docker-compose up -d
```
4. 进入容器控制台
```bash
  docker ps
  docker attach <目标容器ID>
```
5. 关闭容器
```bash
  # 如果只想退出控制台而不关闭容器
  # 则可以使用组合键 Ctrl + P 后紧接着按 Ctrl + Q即可退出控制台
  docker-compose down
```
6. 重启服务器
```bash
  # 注意：
  # 该命令须在Minecraft服务端控制台内执行
  # 如果需要彻底关闭服务器请选择直接关闭容器
  # 而不是通过这个方式来进行关闭
  # 另外重启后会断开与容器的链接
  # 如需重新进入控制台，请使用docker attach <目标容器ID>链接
  stop
```

## 五、更新日志
请移步至 [更新日志](./CHANGELOG.md) 中查看详细内容。