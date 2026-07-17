# Claude Code configuration

fish_add_path --append $HOME/.local/bin

set -gx ANTHROPIC_BASE_URL "https://api.deepseek.com/anthropic"

set -gx ANTHROPIC_MODEL "deepseek-v4-pro"
set -gx ANTHROPIC_DEFAULT_OPUS_MODEL "deepseek-v4-pro"
set -gx ANTHROPIC_DEFAULT_SONNET_MODEL "deepseek-v4-pro"
set -gx ANTHROPIC_DEFAULT_HAIKU_MODEL "deepseek-v4-flash"
set -gx CLAUDE_CODE_SUBAGENT_MODEL "deepseek-v4-flash"

set -gx CLAUDE_CODE_EFFORT_LEVEL "max"
