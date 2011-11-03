
PATH=$PATH:/usr/local:/usr/local/sbin
##
# Your previous /Users/matt/.bash_profile file was backed up as /Users/matt/.bash_profile.macports-saved_2010-11-16_at_19:18:03
##

# MacPorts Installer addition on 2010-11-16_at_19:18:03: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

# GIT Configs
git_completion_script=/usr/local/git/contrib/completion/git-completion.bash
if test -f $git_completion_script; then
  source $git_completion_script
fi

function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
}
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
}

export PS1='\[\033[01;32m\]\u@local\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]$(parse_git_branch)$ '
export NGINX_CONFIG_DIR=/opt/local/etc/nginx/
