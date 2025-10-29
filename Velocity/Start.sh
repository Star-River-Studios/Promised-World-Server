#!/bin/bash

# 定义各项参数
jvmArgs=(
    "-Xms1024M"
    "-Xmx1024M"
    "-Dfile.encoding=UTF-8"
    "-Dterminal.ansi=true"
    "--add-modules=jdk.incubator.vector"
    "-Dvelocity.max-known-packs=1024"
)
authlibArgs=()
agentArgs=()
jarFile=(
    "velocity-server.jar"
)
programArgs=()

# 执行 Java 命令
sleep 1
echo "正在启动 Minecraft 服务器..."
sleep 1
echo "已设定JVM参数：${jvmArgs[*]:-无}"
sleep 1
echo "已设定外置登录参数：${authlibArgs[*]:-无}"
sleep 1
echo "已设定代理参数：${agentArgs[*]:-无}"
sleep 1
echo "已设定JAR核心文件：${jarFile[*]}"
sleep 1
echo "已设定程序参数：${programArgs[*]:-无}"
sleep 1
echo "参数设置完成，正在启动..."
exec java "${jvmArgs[@]}" "${authlibArgs[@]}" "${agentArgs[@]}" -jar "${jarFile[@]}" "${programArgs[@]}"