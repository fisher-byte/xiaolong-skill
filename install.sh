#!/bin/bash
# 小龙你怎么看 - Claude Code Skill 安装脚本
# 运行方式：bash install.sh

set -e

SKILL_NAME="xiaolong"
SKILL_DIR="$(cd "$(dirname "$0")/skills/xiaolong" && pwd)"
SKILLS_ROOT="$HOME/.claude/skills"

echo ""
echo "📦 安装「小龙你怎么看」skill..."
echo ""

# 检查 Claude Code 是否安装
if ! command -v claude &>/dev/null; then
  echo "⚠️  未检测到 Claude Code（claude 命令）。"
  echo "   请先安装：https://claude.ai/download"
  echo "   安装完成后重新运行此脚本。"
  exit 1
fi

# 创建 skills 目录（如不存在）
mkdir -p "$SKILLS_ROOT"

# 删除旧版本的 symlink（如存在）
if [ -L "$SKILLS_ROOT/$SKILL_NAME" ]; then
  rm "$SKILLS_ROOT/$SKILL_NAME"
  echo "   已移除旧版本 symlink"
fi

# 创建 symlink
ln -sf "$SKILL_DIR" "$SKILLS_ROOT/$SKILL_NAME"

echo "✅ 安装完成！"
echo ""
echo "   Skill 路径：$SKILL_DIR"
echo "   注册到：$SKILLS_ROOT/$SKILL_NAME"
echo ""
echo "使用方式："
echo "   在 Claude Code 对话中直接说："
echo "   「小龙你怎么看……」"
echo "   「/xiaolong 要不要做……」"
echo "   「张小龙会怎么看这个设计……」"
echo ""
