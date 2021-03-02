# Aliases
#############

alias g='git'

alias ga='git add'
alias gaa='git add --all'
alias gai='git add --interactive'
alias galias='git_list_aliases'
# Amend the most recent local commit:
alias gam='git commit --amend -m' # Only change commit message (optionally 'git add' files)
alias gama='git commit --amend -am' # Add all modified files and change commit message
alias gan='git commit --amend --no-edit' # Keep commit message (optionally 'git add' files)
alias gana='git commit --amend --no-edit -a' # Add all modified files, but keep commit message
alias gap='git add --patch'

alias gb='git branch'
alias gba='git branch --all'
alias gbd='git branch --delete'
alias gbdf='git branch --delete --force'
alias gbl='git blame'
# 'git blame' that optionally takes line numbers:
# Usage: gbll <file> [<from line>] [<to line>]
#   E.g. gbll README.md 10
#      = gbll README.md 10 10
#      = gbll README.md 10,10
#      = git blame README.md -L 10,10
alias gbll='git_blame_line'
alias gbls='git branch --list | cat'
alias gbs='git bisect'
alias gbsb='git bisect bad'
alias gbsg='git bisect good'
alias gbsr='git bisect reset'
alias gbss='git bisect start'

alias gc='git commit --verbose'
alias gcam='git commit -am'
alias gcame='git commit --allow-empty-message -am ""'
alias gcamg='git commit --gpg-sign -am'
alias gcams='git commit --signoff -am'
alias gcamu='git commit -am "Update"'
alias gcem='git commit --allow-empty -m'
alias gcf='git config'
alias gcfl='git config --list'
alias gcfls='git config --list | cat'
alias gcl='git clone --recurse-submodules'
alias gclcd='git_clone_and_cd'
alias gcm='git commit -m'
alias gcmg='git commit --gpg-sign -m'
alias gcms='git commit --signoff -m'
# Count the number of commits on a branch:
alias gcnt='git_count'
alias gcnta='git_count_all'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gcobb='git checkout -' # "checkout branch before"
# Check out a child commit:
# Usage: gcoc [<number of commits after HEAD>]
#   E.g. gcoc = gcoc 1   => checks out direct child
#               gcoc 2   => checks out grandchild
alias gcoc='git_checkout_child'
alias gcod='git checkout develop'
alias gcom='git checkout $(git_main_branch)'
# Check out a parent commit:
# Usage: gcop [<number of commits before HEAD>]
#   E.g. gcop = gcop 1   => checks out direct parent
#               gcop 2   => checks out grandparent
alias gcop='git_checkout_parent'
alias gcp='git cherry-pick'
alias gcpa='git cherry-pick --abort'
alias gcpc='git cherry-pick --continue'

alias gd='git diff'
alias gds='git diff --staged'
# Show the diff between latest stash and local working tree:
alias gdst='git diff stash@{0}' # = git stash show -l
# Show the diff between latest stash and HEAD:
alias gdsth='git diff stash@{0} HEAD'
# Show the diff between latest stash and its original parent commit:
alias gdstp='git diff stash@{0}^ stash@{0}' # = git stash show -p

alias gf='git fetch'
alias gfo='git fetch origin'

# git graph branches:
alias ggb='git log --graph --all --simplify-by-decoration --date=format:"%d/%m/%y" --pretty=format:"%C(yellow)%h%Creset%x09%C(bold green)%D%Creset%n%C(white)%ad%Creset%x09%C(bold)%s%Creset%n"'

# Ignore already tracked files:
alias gignore='git update-index --skip-worktree'
alias gunignore='git update-index --no-skip-worktree'
alias gignored='git ls-files -v | grep ^S'

# Best default 'git log':
alias gl='glog --name-status'
# View the full change history of a single file:
# Usage: glf <file> [<from line>] [<to line>]
alias glf='git_log_file'
# Fancy 'git log --graph':
alias glg='glog --graph'
# Fancy 'git log --graph --oneline':
alias glgo='git log --graph --date=format:"%d/%m/%y" --pretty=format:"%C(yellow)%h%Creset   %C(white)%ad%Creset   %C(bold)%s    %C(bold green)%D%Creset%n"'
# Fancy 'git log --graph --stat':
alias glgs='glog --graph --stat'
# Fancy 'git log --oneline':
alias glo='git log --date=format:"%d/%m/%y" --pretty=format:"%C(yellow)%h%Creset   %C(white)%ad%Creset   %C(bold)%s    %C(bold green)%D%Creset"'
# Locate all commits in which a specific line of code (string) was first introduced:
# Usage: gloc <Line-of-Code> [<file>]
alias gloc='git_locate_string'
# Regular 'git log' in style:
alias glog='git log --date=format:"%A %B %d %Y at %H:%M" --pretty=format:"%C(yellow)%H%Creset%x09%C(bold green)%D%Creset%n%<|(40)%C(white)%ad%x09%an%Creset%n%n    %C(bold)%s%Creset%n%w(0,4,4)%n%-b%n"' # %w(0,4,4): no line-wrap, indent first line 4 chars, subsequent lines also 4 lines
alias glr='glog --reverse --name-status'
alias gls='git ls-files'

alias gm='git merge'
alias gmom='git merge origin/$(git_main_branch)'
alias gmum='git merge upstream/$(git_main_branch)'
alias gmv='git mv'

alias gp='git push'
alias gpd='git push --delete'
alias gpdo='git push --delete origin'
alias gpf='git push --force-with-lease'
alias gpt='git push && git push --tags'
alias gpl='git pull'
alias gplr='git pull --rebase'
alias gplrs='git pull --recurse-submodules'

# `grhard` is intentionally more verbose because `--hard` is unsafe;
# there is no way to recover uncommitted changes.
# In general the `--keep` flag is preferable. It will do exactly the same,
# but abort if a file has uncommitted changes.
# Having to type 'grhard' in full will make us think twice
# about whether we REALLY want to get rid of all dirty files.
alias gr='git reset --mixed' # Keep changes, but unstage them (`--mixed` = default behaviour)
alias grhard='git reset --hard' # Remove changes, including anything uncommitted (Dangerous!)
alias grk='git reset --keep' # Safer version of `--hard`: reset is aborted if a file is dirty
alias grs='git reset --soft' # Keep changes, and keep them staged
# Reset HEAD to a previous commit:
# Usage: grh [<number of commits before HEAD>]
#   E.g. grh = grh 1   => Reset HEAD to previous commit
#              grh 2   => Reset HEAD 2 commits
alias grh='git_reset_head --mixed'
alias grhhard='git_reset_head --hard'
alias grhk='git_reset_head --keep'
alias grhs='git_reset_head --soft'
alias grb='git rebase'
alias grbm='git rebase $(git_main_branch)'
alias grem='git remote'
alias grema='git remote add'
alias gremrm='git remote rm'
alias gremset='git remote set-url'
alias gremsh='git remote show'
alias gremv='git remote -v'
alias grl='git reflog' # Useful to restore lost commits after reset
alias grm='git rm'

# Yes, I am aware gs is commonly aliased to ghostscript,
# but since my usage of ghostscript is rare compared to git,
# I can live with typing 'ghostscript' in full when necessary.
alias gs='git status'
alias gsh='git show --date=format:"%A %B %d %Y at %H:%M" --pretty=format:"%C(yellow)%H%Creset%x09%C(bold green)%D%Creset%n%<|(40)%C(white)%ad%x09%an%Creset%n%n    %C(bold)%s%Creset%n%w(0,4,4)%+b%n"'
# Show a specified file from stash x (defaults to lastest stash):
# Usage: gshsf <file> [<stash number>]
alias gshsf='git_show_stash_file'
alias gss='git_status_short' # Usage: gss [<number of commits>]
alias gst='git stash'
alias gsta='git stash apply'
alias gstd='git stash drop'
alias gstl='git stash list'
alias gstls='git stash list | cat'
alias gstp='git stash push'
alias gstpop='git stash pop'
# Show the diff between latest stash and local working tree:
alias gstsl='git stash show -l' # = git diff stash@{0}
# Show the diff between latest stash and its original parent commit:
alias gstsp='git stash show -p' # = git diff stash@{0}^! = git diff stash@{0}^ stash@{0}
alias gsub='git submodule'
alias gsuba='git submodule add'
alias gsubi='git submodule update --init' # Initialize submodules
alias gsubpl='git submodule foreach git pull'
alias gsubplom='git submodule foreach git pull origin $(git_main_branch)'
alias gsubs='git submodule status'
alias gsubu='git submodule update --remote --merge' # Update submodules

alias gt='git tag'
alias gtam='git tag -am' # <- takes message before annotated tag name: e.g. gtam 'Release v1.0.0' v1.0.0
alias gtsm='git tag -sm' # GPG sign an annotated tag
alias gtd='git tag --delete'
alias gtl='git tag --list'
alias gtls='git tag --list | cat'

alias gwch='git whatchanged -p --date=format:"%A %B %d %Y at %H:%M" --pretty=format:"%n%n%C(yellow)%H%Creset%x09%C(bold green)%D%Creset%n%<|(40)%C(white)%ad%x09%an%Creset%n%n    %C(bold)%s%Creset%n%w(0,4,4)%+b%n"'


# Functions
################

# git blame that optionally takes line numbers:
# Usage: git_blame_line <file> [<from line>] [<to line>]
function git_blame_line() {
  if [[ -z $1 ]]; then
    echo "Usage:    git_blame_line <file> [<from line>] [<to line>]"
    return 1
  elif [[ -z $2 ]]; then
    2=1   # Set 'from' line number to first line
  elif [[ $2 == *,* ]]; then
    3=${2#*,}
    2=${2%,*}
  elif [[ -z $3 ]]; then
    3=$2
  fi
  git blame $1 -L $2,$3
}

# Checkout parent/older commit:
function git_checkout_parent() {
  git checkout HEAD~$1
}

# Checkout child/newer commit:
function git_checkout_child() {
  children=$(git log --all --ancestry-path ^HEAD --format=format:%H | cat)
  if [[ -z $children ]]; then
    echo -n 'This commit does not have any children\nHEAD remains at '
    git log -1 --oneline | cat
    return 1
  else
    # Take the first child, or the one specified by the input arg:
    child=$(echo $children | tail -n "${1:-1}" | head -n 1)
    # If the child to checkout is at the branch's tip ...
    if [[ "$(echo $children | grep '' -c)" -le "${1:-1}" ]]; then
      branch=$(git branch --contains $child | xargs)
      # ... and there is only 1 branch with that commit ...
      if ! [[ $branch =~ ' ' ]]; then
        # ... checkout the branch itself instead of the specific hash:
        child=$branch
      fi
    fi
  fi

  git checkout $child
}

function git_clone_and_cd() {
  if [[ -z $2 ]]; then
    git clone --recurse-submodules $1 && cd $(basename $1 .git)
  else
    git clone --recurse-submodules $1 $2 && cd $2
  fi
}

function git_count() {
  echo "$(git rev-list --count HEAD) commits total up to current HEAD"
}

function git_count_all() {
  git shortlog -sn | cat
  echo -n '+ _______________________________________\n\n  '
  git_count
}

# List all git aliases from the README:
function git_list_aliases() {
  filename=~/.oh-my-zsh/custom/plugins/git/README.md
  from=$(grep -Fno '| **g** ' ${filename} | cut -f1 -d:)
  stop=$(grep -no '&nbsp;' ${filename} | cut -f1 -d:)
  to=$((stop - 2))

  echo '_______________________________________________________________________________
|             |                                                               |
| Alias       | Command                                                       |
|_____________|_______________________________________________________________|
|             |                                                               |'

  sed -n "${from},${to}p;${stop}q" ${filename} | # Take out table
    tr -d '*\\' |    # Remove **bold** and \ escapes
    sed 's/.$//' |   # Remove last '|' because its no longer lining up
    while read -r line ; do
      echo "${(r:78:)line}" # Pad spaces to 78 chars (zsh specific)
    done |
    sed 's/$/|/'     # Re-append final '|'

  echo '|_____________|_______________________________________________________________|


Note:
This cheatsheet is optimized for memorability,
and may not correspond literally with the actual aliases.

If you want to see all alias implementations, run `alias`.
If you want to see a specific implementation, run `which <alias/function>`.'
}

# Locate all commits in which a specific line of code (string) was first introduced:
function git_locate_string() {
  if [[ -z $1 ]]; then
    echo "Usage:    git_loc <Line-of-Code> [<file>]"
    return 1
  fi
  gl -S $1 -- $2
}

# View the full change history of a single file:
function git_log_file() {
  if [[ -z $1 ]]; then
    echo "Usage:    git_log_file <file> [<from line>] [<to line>]"
    return 1
  elif [[ -z $2 ]]; then
    glog -p -- $1
    return 0
  elif [[ $2 == *,* ]]; then
    3=${2#*,}
    2=${2%,*}
  elif [[ -z $3 ]]; then
    3=$2
  fi
  glog -L $2,$3:$1
}

# Check if main exists and use instead of master:
function git_main_branch() {
  if [[ -n "$(git branch --list main)" ]]; then
  # -n: True if length of string output is non-zero
    echo main
  else
    echo master
  fi
}

# Reset the head to a previous commit (defaults to direct parent):
function git_reset_head() {
  git reset HEAD~$2 $1
  # Failure case:
  if [[ $? != 0 ]]; then
    echo -n 'HEAD remains at '
    git log -1 --oneline | cat
    return 1
  # Success case:
  elif [[ $1 != '--hard' ]]; then
    echo -n 'HEAD is now at '
    git log -1 --oneline | cat
  fi
}

# Show a specified file from stash x (defaults to lastest stash):
function git_show_stash_file() {
  if [[ -z $1 ]]; then
    echo "Usage:    git_show_stash_file <file> [<stash number>]"
    return 1
  fi
  git show stash@{${2:-0}}:$1
}

# Print short status and log of latest commits:
function git_status_short() {
  if [[ -z $(git status -s) ]]; then
    echo 'Nothing to commit, working tree clean\n'
  else
    git status -s && echo ''
  fi
  git log -${1:-3} --oneline | cat
}
