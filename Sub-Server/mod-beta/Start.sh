#!/bin/bash

# 定义各项参数
jvmArgs=(
    "-Xms4096M"
    "-Xmx4096M"
    "-Dfile.encoding=UTF-8"
    "-Dterminal.ansi=true"
    "--add-modules=jdk.incubator.vector"
)
authlibArgs=()
jarFile=(
    "youer-server.jar"
)
programArgs=(
    "nogui"
)

# 执行 Java 命令
sleep 1
echo "正在启动 Minecraft 服务器..."
sleep 1
echo "已设定JVM参数：${jvmArgs[*]:-无}"
sleep 1
echo "已设定外置登录参数：${authlibArgs[*]:-无}"
sleep 1
echo "已设定JAR核心文件：${jarFile[*]}"
sleep 1
echo "已设定程序参数：${programArgs[*]:-无}"
sleep 1
echo "参数设置完成，正在启动..."
exec java "${jvmArgs[@]}" "${authlibArgs[@]}" -jar "${jarFile[@]}" "${programArgs[@]}"