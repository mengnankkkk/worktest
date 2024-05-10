@echo off
REM 提交更改到 main 分支的批处理文件

REM 设置 Git 仓库路径
set repo_path=D:\Uploading
REM set repo_path = D:\new

REM 添加例外规则，允许当前用户对该目录进行 Git 操作
git config --global --add safe.directory %repo_path%

REM 切换到 Git 仓库目录
cd /D %repo_path%

REM 添加所有更改到暂存区
git add --all .

REM 提交更改到 main 分支
git commit -m "update"

REM 推送更改到远程 main 分支
git push origin main

REM 显示完成消息
echo "更改已提交到 main 分支"
pause


