#!/bin/bash

# 定义基本参数
memory="8192M"
argsFile="@libraries/net/neoforged/neoforge/21.1.217/unix_args.txt"

# 定义高级参数
jvmArgs=(
    # === 垃圾收集器 ===
    "-XX:+UseG1GC" # 使用 G1 垃圾收集器（通用、跨平台、稳定）
    "-XX:MaxGCPauseMillis=300" # GC 停顿目标 300ms，平衡吞吐和延迟
    "-XX:InitiatingHeapOccupancyPercent=25" # Old Gen 使用 25% 时启动并发 GC，防止 Old Gen 堆爆满触发 Full GC
    "-XX:ParallelGCThreads=2" # 并行 GC 线程数
    "-XX:ConcGCThreads=1" # 并发 GC 线程数

    # === 内存访问稳定性 ===
    "-XX:+AlwaysPreTouch" # 启动时预分配并访问内存页，减少运行时 page fault

    # === 安全与防护 ===
    "-XX:+DisableExplicitGC" # 禁止显式调用 System.gc()，避免插件或服务器触发 Full GC（调试/诊断时如有问题可暂时移除）

    # === 控制台 / 日志 ===
    "-Dterminal.ansi=true" # 启用控制台 ANSI 颜色支持，便于日志可读性
    "-Dlog4j2.formatMsgNoLookups=true" # Log4j2 安全参数，防止远程代码执行漏洞

    # === SpongeNeo / NeoForge 特定优化 ===
    "-Dmixin.debug.export=false" # 禁止 Mixin 导出调试信息，减少启动日志杂乱
    "--add-modules=jdk.incubator.vector" # 启用向量 API，可提升部分数值计算性能
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