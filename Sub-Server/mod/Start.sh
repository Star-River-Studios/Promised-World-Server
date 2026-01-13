#!/bin/bash

# 定义基本参数
memory="10240M"
argsFile="@libraries/net/neoforged/neoforge/21.1.218/unix_args.txt"

# 定义高级参数
jvmArgs=(
    # === 垃圾收集器 ===
    "-XX:+UseZGC" # 使用 Z 垃圾收集器（适用于大内存）
    "-XX:+ZGenerational" # 启用 Z 垃圾收集器中的代际垃圾收集

    # === 内存访问稳定性 ===
    "-XX:+AlwaysPreTouch" # 预分配内存，提高启动速度
    "-XX:+UseContainerSupport" # 启用容器内存感知

    # === 安全与防护 ===
    "-XX:+DisableExplicitGC" # 禁止显式调用 System.gc()，避免插件或服务器触发 Full GC（调试/诊断时如有问题可暂时移除）

    # === 控制台 / 日志 ===
    "-Dterminal.ansi=true" # 启用控制台 ANSI 颜色支持，便于日志可读性
    "-Dlog4j2.formatMsgNoLookups=true" # Log4j2 安全参数，防止远程代码执行漏洞
    "-Xlog:gc*,gc+age=info,gc+heap=info" # 启用 GC 日志，可查看 GC 运行情况

    # === SpongeNeo / NeoForge 特定优化 ===
    "-Dmixin.debug.export=false" # 禁止 Mixin 导出调试信息，减少启动日志杂乱
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
echo "已设定启动参数文件：${argsFile}"
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
exec java "-Xmx${memory}" "-Xms${memory}" "${jvmArgs[@]}" "${authlibArgs[@]}" "${agentArgs[@]}" "${argsFile}" "${programArgs[@]}"