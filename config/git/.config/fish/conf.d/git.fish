# Apply git identity from environment variables
# Set GIT_USER_NAME and GIT_USER_EMAIL in git-env.fish

if set -q GIT_USER_NAME
    git config --global user.name "$GIT_USER_NAME"
end

if set -q GIT_USER_EMAIL
    git config --global user.email "$GIT_USER_EMAIL"
end
