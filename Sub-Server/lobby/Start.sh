#!/bin/bash

# 定义基本参数
memory="2048M"
jarFile="paper-server.jar"

# 定义高级参数
jvmArgs=(
    # === 垃圾收集器 ===
    "-XX:+UseG1GC" # 使用 G1 垃圾收集器（通用、跨平台、稳定）

    # === 内存访问稳定性 ===
    "-XX:+UseContainerSupport" # 启用容器内存感知

    # === 安全与防护 ===
    "-XX:+DisableExplicitGC" # 禁止显式调用 System.gc()，避免插件或服务器触发 Full GC（调试/诊断时如有问题可暂时移除）

    # === 控制台 / 日志 ===
    "-Dterminal.ansi=true" # 启用控制台 ANSI 颜色支持，便于日志可读性
    "-Dlog4j2.formatMsgNoLookups=true" # Log4j2 安全参数，防止远程代码执行漏洞

    # === Paper 特定优化 ===
    "-Dpaper.noTickViewDistance=true" # 视距外区块不 Tick，优化性能
    "-Dpaper.disableChannelLimit" # 禁用频道数量限制，解决 Modpack 进入服务器时的频道数量限制
)
authlibArgs=()
agentArgs=()
programArgs=(
    "nogui"
)

# 执行 Java 命令
sleep 1
echo "正在启动 Minecraft 服务器..."
sleep 1
echo "正在设定基本参数..."
sleep 1
echo "已设定内存：${memory}"
sleep 1
echo "已设定JAR核心文件：${jarFile}"
sleep 1
echo "正在设定高级参数..."
sleep 1
echo "已设定JVM参数：${jvmArgs[*]:-无}"
sleep 1
echo "已设定外置登录参数：${authlibArgs[*]:-无}"
sleep 1
echo "已设定代理参数：${agentArgs[*]:-无}"
sleep 1
echo "已设定程序参数：${programArgs[*]:-无}"
sleep 1
echo "全部参数设定完成，正在启动..."
exec java "-Xmx${memory}" "-Xms${memory}" "${jvmArgs[@]}" "${authlibArgs[@]}" "${agentArgs[@]}" -jar "${jarFile}" "${programArgs[@]}"