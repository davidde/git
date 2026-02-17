# Aliases
#############

alias g='git'

alias ga='git add'
alias gaa='git add --all'
alias gai='git add --interactive'
alias galias='git_list_aliases'

# Amend the most recent local commits.
# Amend commit; modify commit message, optionally 'git add' files:
alias gam='git commit --amend -m'
# Amend commit; modify commit message, and add all modified files:
alias gama='git commit --amend -am'
# Amend commit; keep commit message, optionally 'git add' files:
alias gan='git commit --amend --no-edit'
# Amend commit; keep commit message, and add all modified files:
alias gana='git commit --amend --no-edit -a'

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
alias gbls='git branch --all'
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
# Create a commit without any changes, e.g. for testing CI/CD:
# E.g. git commit --allow-empty -m "Triggering build"
alias gcem='git commit --allow-empty -m'
alias gcf='git config'
alias gcfg='git config --global'
alias gcfl='git config --local'
alias gcfls='git config --list'
alias gcl='git_clone_and_cd'
alias gcm='git commit -m'
alias gcmg='git commit --gpg-sign -m'
alias gcms='git commit --signoff -m'
# Count the number of commits on a branch:
alias gcnt='git_count'
alias gco='git checkout'
alias gcob='git checkout -b'
# "git checkout branch before":
# Checkout the branch you were on right before switching to the current one
alias gcobb='git checkout -'
# Checkout a child (younger) commit:
# Usage: gcoc [<number of commits after HEAD>]
#   E.g. gcoc = gcoc 1   => checks out direct child
#               gcoc 2   => checks out grandchild
alias gcoc='git_checkout_child'
alias gcod='git checkout develop'
alias gcof='git checkout -f'
alias gcom='git checkout $(git_main_branch)'
# Checkout a parent (older) commit:
# Usage: gcop [<number of commits before HEAD>]
#   E.g. gcop = gcop 1   => checks out direct parent
#               gcop 2   => checks out grandparent
alias gcop='git_checkout_parent'
alias gcp='git cherry-pick'
alias gcpa='git cherry-pick --abort'
alias gcpc='git cherry-pick --continue'
alias gcpq='git cherry-pick --quit'
alias gcps='git cherry-pick --skip'

alias gd='git --no-pager diff'
alias gds='git --no-pager diff --staged'
# Show the diff between latest stash and local working tree:
# = git stash show -l:
alias gdst='git --no-pager diff stash@{0}'
# Show the diff between latest stash and HEAD:
alias gdsth='git --no-pager diff stash@{0} HEAD'
# Show the diff between latest stash and its original parent commit:
# = git stash show -p:
alias gdstp='git --no-pager diff stash@{0}^ stash@{0}'

alias gf='git fetch'
alias gfo='git fetch origin'

# git graph (all commits):
alias gg='git --no-pager log --graph --all --date=format:"%d/%m/%Y" --format=format:"%C(yellow)%h%Creset%x09%C(dim white)%an%Creset%x09%C(bold green)%D%Creset%n%C(white)%ad%Creset%x09%C(bold)%s%Creset%n"'
# git graph branches:
alias ggb='gg --simplify-by-decoration'
alias ggbo='ggo --simplify-by-decoration'
# git graph --oneline (all commits):
alias ggo='git --no-pager log --graph --all --date=format:"%d/%m/%Y" --format=format:"%C(yellow)%h%Creset   %C(white)%ad%Creset   %C(bold)%s   %C(bold green)%D%Creset%n"'

# Ignore already tracked files:
alias gig='git update-index --skip-worktree'
# Unignore ignored files:
alias gug='git update-index --no-skip-worktree'
# List ignored files:
alias glsig='git ls-files -v | grep ^S'

# "git log --name-status" that always defaults to 10 commits:
alias gl='glog -10'
# View the full change history of a single file:
# Usage: glf <file> [<from line>] [<to line>]
alias glf='git_log_file'
# "git log --oneline":
alias glo='git --no-pager log --date=format:"%d/%m/%Y" --format=format:"%C(yellow)%h%Creset   %C(white)%ad%Creset   %C(bold)%s   %C(bold green)%D%Creset"'
# Locate all commits in which a specific line of code (string) was first introduced:
# Usage: gloc <Line-of-Code> [<file>]
alias gloc='git_locate_string'
# Regular 'git log' in style:
alias glog='git --no-pager log --reverse --name-status --date=format:"%A %B %d %Y at %H:%M" --format=format:"%C(yellow)%H%Creset%x09%C(bold green)%D%Creset%n%<|(40)%C(white)%ad%x09%an%Creset%n%n    %C(bold)%s%Creset%n%w(0,4,4)%n%-b%n"' # %w(0,4,4): no line-wrap, indent first line 4 chars, subsequent lines also 4 lines

# git list branches:
alias glsb='git branch --all'
# git list tracked files:
alias glsf='git ls-files'
# git list remotes:
alias glsr='git remote -v'
# git list submodules:
alias glss='git config --file .gitmodules --name-only --get-regexp path'
# git list stashes:
alias glsst='git --no-pager stash list'
# git list tags:
alias glst='git --no-pager tag --list'

alias gm='git merge'
# Try to merge origin/main into the currently active branch:
alias gmom='git merge origin/$(git_main_branch)'
# Try to merge upstream/main into the currently active branch:
alias gmum='git merge upstream/$(git_main_branch)'
alias gmv='git mv'

alias gph='git push'
# Delete a branch from a remote:
# Usage: gphd origin feat-branch
alias gphd='git push --delete'
# Delete a branch from the origin remote:
# Usage: gphdo feat-branch
alias gphdo='git push --delete origin'
alias gphf='git push --force-with-lease'
alias gphff='git push --force'
alias gpht='git push && git push --tags'
# The `-u` or `--set-upstream` flag configures a local branch
# to track a remote branch. This initializes a new branch on the remote,
# and tells Git that the remote branch is the default "upstream"
# counterpart of the local branch.
# Usage: gphu origin main
alias gphu='git push -u'
# Transfer the specified local branch to the 'origin' remote repository,
# and set the local branch to track its remote equivalent.
# Usage: gphuo main
alias gphuo='git push -u origin'
# Transfer the 'main' branch to the 'origin' remote repository,
# and set the local 'main' to track the remote 'main'.
# Usage: gphuom
alias gphuom='git push -u origin main'
alias gpl='git pull'
# Stash "dirty" uncommitted changes, do git pull, and pop
# the uncommitted changes back out after pull completes:
alias gpla='git pull --autostash'
alias gplr='git pull --rebase'
alias gplrs='git pull --recurse-submodules'

# 'git reset' flags:
# * --mixed (default): Keep changes, but unstage them
# * --hard: Remove changes, including anything uncommitted (Dangerous!)
# * --keep: Safer version of `--hard`; reset will be
#           aborted if there are any dirty files
# * --soft: Keep changes, and keep them staged

# 'git reset' default behaviour = '--mixed' flag:
# Keep changes, but unstage them
alias gr='git reset'
# git reset head:
# `git reset` defaults to the `--mixed` flag, which means
# it will keep the changes, but unstage them.
# => This resets the latest commit (= HEAD = HEAD~0) of the branch,
# by default to the previous commit (= HEAD~ = HEAD~1).
# Provide a number argument to reset to a commit further back.
# Usage: grh [<number of commits before HEAD>]
#   E.g. grh = grh 1 => Reset HEAD to previous commit
#              grh 2 => Reset HEAD 2 commits
alias grh='git_reset_head --mixed'

# `--hard` flag: Remove changes, including anything uncommitted (Dangerous!)
# `grhard` is intentionally more verbose because `--hard` is unsafe;
# there is no way to recover uncommitted changes.
# In general, the `--keep` flag is preferable. It will do exactly the same,
# but abort if a file has uncommitted changes.
# Having to type 'grhard' in full will make us think twice
# about whether we really want to get rid of all dirty files.
alias grhard='git reset --hard'
alias grhhard='git_reset_head --hard'
# `--keep` flag = Safer version of `--hard`:
# reset will be aborted if there are any dirty files
alias grhk='git_reset_head --keep'
# `--soft` flag: Keep changes, and keep them staged
alias grhs='git_reset_head --soft'
alias grk='git reset --keep'
alias grs='git reset --soft'

alias grb='git rebase'
alias grbm='git rebase $(git_main_branch)'

alias gre='git restore'
alias grea='git restore .'

alias grem='git remote'
alias grema='git remote add'
alias gremao='git remote add origin'
alias gremls='git remote -v'
alias gremrm='git remote rm'
alias gremrmo='git remote rm origin'
alias gremset='git remote set-url'
alias gremseto='git remote set-url origin'
alias gremsh='git remote show'
alias gremv='git remote -v'
alias grl='git reflog' # Useful to restore lost commits after reset
alias grm='git rm'

# Yes, I am aware gs is commonly aliased to ghostscript,
# but since my usage of ghostscript is rare compared to git,
# I can live with typing 'ghostscript' in full when necessary.
alias gs='git status'
alias gsh='git --no-pager show'
# Show a specified file from stash x (defaults to lastest stash):
# Usage: gshsf <file> [<stash number>]
alias gshsf='git_show_stash_file'
alias gss='git_status_short' # Usage: gss [<number of commits>]
alias gst='git stash'
alias gsta='git stash apply'
alias gstd='git stash drop'
alias gstl='git stash list'
alias gstls='git --no-pager stash list'
alias gstph='git stash push'
alias gstpp='git stash pop'
# Show the diff between latest stash and local working tree:
alias gstshl='git stash show -l' # = git diff stash@{0}
# Show the diff between latest stash and its original parent commit:
alias gstshp='git stash show -p' # = git diff stash@{0}^! = git diff stash@{0}^ stash@{0}

alias gsub='git submodule'
alias gsuba='git submodule add'
alias gsubi='git submodule update --init' # Initialize submodules
alias gsubf='git submodule foreach'
alias gsubfpl='git submodule foreach git pull'
alias gsubfplom='git submodule foreach git pull origin $(git_main_branch)'
alias gsubs='git submodule status'
alias gsubu='git submodule update --remote --merge' # Update submodules

alias gt='git tag'
alias gtam='git tag -am' # <- takes message before annotated tag name: e.g. gtam 'Release v1.0.0' v1.0.0
alias gtd='git tag --delete'
alias gtl='git tag --list'
alias gtls='git --no-pager tag --list'
alias gtsm='git tag -sm' # GPG sign an annotated tag


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
  git shortlog -sn | cat
  echo -n '+ _______________________________________\n\n  '
  echo "$(git rev-list --count HEAD) commits total up to current HEAD"
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

# Check if main branch exists, otherwise use master branch:
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
