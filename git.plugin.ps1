###################################
#         Git shortcuts           #
###################################
function g {
  git @args
}

function ga {
  git add @args
}

function gaa {
  git add --all
}

function gai {
  git add --interactive @args
}

# Amend commit; modify commit message, optionally 'git add' files:
function gam {
  param ($message)
  git commit --amend -m $message
}

# Amend commit; modify commit message, and add all modified files:
function gama {
  param ($message)
  git commit --amend -am $message
}

# Amend commit; keep commit message, optionally 'git add' files:
function gan {
  git commit --amend --no-edit
}

# Amend commit; keep commit message, and add all modified files:
function gana {
  git commit --amend --no-edit -a
}

function gap {
  git add --patch @args
}

function gb {
  git branch @args
}

# List all branches:
function gba {
  git branch --all
}

function gbd {
  git branch --delete @args
}

function gbdf {
  git branch --delete --force @args
}

function gbl {
  git blame @args
}

# List all branches:
function gbls {
  git branch --all
}

function gbs {
  git bisect @args
}

function gbsb {
  git bisect bad @args
}

function gbsg {
  git bisect good @args
}

function gbsr {
  git bisect reset
}

function gbss {
  git bisect start
}

# Remove the builtin powershell `gc`:
# (Alias for Get-Content)
Remove-Item -Path Alias:gc -Force

function gc {
  git commit --verbose @args
}

function gcam {
  git commit -am @args
}

function gcame {
  git commit --allow-empty-message -am ""
}

function gcamg {
  git commit --gpg-sign -am @args
}

function gcams {
  git commit --signoff -am @args
}

function gcamu {
  git commit -am "Update"
}

# Create a commit without any changes, e.g. for testing CI/CD:
# E.g. git commit --allow-empty -m "Triggering build"
function gcem {
  git commit --allow-empty -m @args
}
function gcf {
  git config @args
}

function gcfg {
  git config --global @args
}

function gcfl {
  git config --local @args
}

function gcfls {
  git config --list @args
}

# Git clone and cd into project:
function gcl {
  param ($url, $path)
  if ($path) {
    git clone --recurse-submodules @args $url $path
    Set-Location $path
  } else {
    git clone --recurse-submodules @args $url
    Set-Location ([io.path]::GetFileNameWithoutExtension($url))
  }
}

# Remove the builtin powershell `gcm`:
# (Alias for Get-Command)
Remove-Item -Path Alias:gcm -Force

function gcm {
  git commit -m @args
}

function gcmg {
  git commit --gpg-sign -m @args
}

function gcms {
  git commit --signoff -m @args
}

# Count the number of commits on a branch:
function gcnt() {
  git shortlog -sn
  Write-Output "  + ___________________________________`n"
  Write-Output "    $(git rev-list --count HEAD) commits total up to current HEAD`n"
}

function gco {
  git checkout @args
}

function gcob {
  git checkout -b @args
}

# git checkout branch before:
# checkout the branch you were on right before switching to the current one
function gcobb {
  git checkout -
}

# Checkout a child (younger) commit:
# Usage: gcoc [<number of commits after HEAD>]
#   E.g. gcoc = gcoc 1   => checks out direct child
#               gcoc 2   => checks out grandchild
function gcoc() {
  $children = $(git --no-pager log --all --ancestry-path ^HEAD --format=format:%H)
  Write-Host ""

  if (-not $children) {
    Write-Host "This commit does not have any children, HEAD remains at:`n     "  -NoNewline
    git --no-pager log -1 --oneline
    Write-Host ""
    return
  } else {
    # Take the first child, or the one specified by the input arg:
    $count = if ($args[0]) { $args[0] } else { 1 }
    $child = $(Write-Output $children | Select-Object -Last $count | Select-Object -First 1)
    # If the child to checkout is at the branch's tip ...
    if (@($children).Count -le $count) {
      $branches = $(git branch --contains $child).Replace('*', '').Trim() -join ' '
      # ... and there is only 1 branch with that commit ...
      if ($branches -notmatch ' ') {
        # ... checkout the branch itself instead of the specific hash:
        $child = $branches
      }
    }
  }

  git checkout $child
}

function gcod {
  git checkout develop
}

function gcof {
  git checkout -f @args
}

# Check if main branch exists, otherwise use master branch:
function git_main_branch() {
  if (git branch --list main) {
    "main"
  } else {
    "master"
  }
}

function gcom {
  git checkout $(git_main_branch)
}

# Checkout a parent (older) commit:
# Usage: gcop [<number of commits before HEAD>]
#   E.g. gcop = gcop 1   => checks out direct parent
#               gcop 2   => checks out grandparent
function gcop() {
  param([int]$count = 1)
  git checkout HEAD~$count
}

function gcp() {
  git cherry-pick @args
}

function gcpa() {
  git cherry-pick --abort
}

function gcpc() {
  git cherry-pick --continue
}

function gcpq() {
  git cherry-pick --quit
}

function gcps() {
  git cherry-pick --skip
}

function gd {
  git --no-pager diff @args
}

function gds {
  git --no-pager diff --staged @args
}

# Show the diff between latest stash and local working tree:
# = git stash show -l:
function gdst {
  git --no-pager diff 'stash@{0}' @args
}

# Show the diff between latest stash and HEAD:
function gdsth {
  git --no-pager diff 'stash@{0}' HEAD
}

# Show the diff between latest stash and its original parent commit:
# = git stash show -p
function gdstp {
  git --no-pager diff 'stash@{0}^' 'stash@{0}'
}

function gf {
  git fetch @args
}

function gfo {
  git fetch origin @args
}

# git graph commits:
function gg {
  git --no-pager log --graph --all --date=format:"%d/%m/%Y" --format=format:"%C(yellow)%h%Creset%x09%C(dim white)%an%Creset%x09%C(bold green)%D%Creset%n%C(white)%ad%Creset%x09%C(bold)%s%Creset%n" @args
}

# git graph branches:
function ggb {
  gg --simplify-by-decoration
}

# Defaults to full commit log when no args provided;
# but allows passing `-[number]` to get a specific amount of commits
function glg {
  param ($num)
  Write-Output ""
  git --no-pager log $num --name-status --reverse --date=format:"%A %B %d %Y at %H:%M" --pretty=format:"%C(yellow)%H%Creset%x09%C(bold green)%D%Creset%n%<|(40)%C(white)%ad%x09%an%Creset%n%n    %C(bold)%s%Creset%n%w(0,4,4)%n%-b%n"
  Write-Output "`r`n"
}

# Remove the builtin powershell `gl`:
# (Alias for Get-Location)
Remove-Item -Path Alias:gl -Force

# Always defaults to 10 commits git log:
function gl {
  glg -10
}

function glsf {
  # git list files:

  git ls-files
}

function glsb {
  # git list branches:

  git branch --all
}

function glsr {
  # git list remotes:

  git remote -v
}

function glss {
  # git list submodules:

  git config --file .gitmodules --name-only --get-regexp path
}

function gmv {
  param ($source, $dest)
  git mv $source $dest
}

function gph {
  git push @args
}

function gphu {
  # The `-u` or `--set-upstream` flag configures a local branch
  # to track a remote branch. This initializes a new branch on the remote,
  # and tells Git that the remote branch is the default "upstream"
  # counterpart of the local branch.
  # Usage: gphu origin main

  git push -u @args
}

function gphuo {
  # Transfer the specified local branch to the 'origin' remote repository,
  # and set the local branch to track its remote equivalent.
  # Usage: gphuo main

  git push -u origin @args
}

function gphuom {
  # Transfer the 'main' branch to the 'origin' remote repository,
  # and set the local 'main' to track the remote 'main'.
  # Usage: gphuom

  git push -u origin main
}

function gpl {
  git pull @args
}

function gr {
  git reset @args
}

function grb {
  git rebase @args
}

function grh {
  git reset --hard @args
}

function grhd {
  # git reset head:
  # Resets the latest commit (= HEAD = HEAD~0) of the repo,
  # by default to the previous commit (= HEAD~ = HEAD~1).
  # `git reset` defaults to the `--mixed` flag, which means
  # it will keep the changes, but unstage them.
  # Provide a number argument to reset to a commit further back.
  # Usage: grhd 5

  param ($num)
  git reset HEAD~$num
}

function grhdh {
  # git reset head hard:
  # Resets the latest commit (= HEAD = HEAD~0) of the repo,
  # by default to the previous commit (= HEAD~ = HEAD~1).
  # The `--hard` flag will remove all changes, including anything
  # uncommitted! (Beware; there is no way to recover uncommitted changes!)
  # Provide a number argument to reset to a commit further back.
  # Usage: grhdh 5

  param ($num)
  git reset HEAD~$num --hard
}

function grem {
  git remote @args
}

function grema {
  # Add a remote by name and URL.
  # Usage: grema origin https://github.com/...

  git remote add @args
}

function gremao {
  # Add the 'origin' remote by its URL.
  # Usage: gremao https://github.com/...

  git remote add origin @args
}

# List all remotes:
function gremls {
  git remote -v
}

function gremrm {
  # Remove a remote by its name.
  # Usage: gremrm origin

  git remote rm @args
}

function gremrmo {
  # Remove the 'origin' remote

  git remote rm origin
}

function gremsu {
  # Update a remote's URL.
  # Usage: gremsu origin https://github.com/...

  git remote set-url @args
}

function gremsuo {
  # Update the 'origin' remote's URL.
  # Usage: gremsuo https://github.com/...

  git remote set-url origin @args
}

function grm {
  git rm @args
}

function grst {
  # Restore previous state of files:
  # - git restore path/to/file = restore to last committed version
  # - git restore . = throw away all uncommitted changes
  #                   (restore all files to last committed versions)

  git restore @args
}

function gs {
  git status @args
}

function gss {
  git status --short
}

function gsh {
  # By default this shows the diff between the last 2 commits;
  # AKA what was added in the last commit:

  git --no-pager show @args
}

function gst {
  # By default, the `git stash` command is an alias for `git stash push`.

  git stash @args
}

function gsta {
  git stash apply @args
}

function gstd {
  git stash drop @args
}

function gstls {
  git --no-pager stash list
}

function gstph {
  git stash push @args
}

function gstpp {
  git stash pop @args
}

function gstshl {
  # Show the diff between latest stash and local working tree:
  # = git diff stash@{0}

  git stash show -l
}

function gstshp {
  # Show the diff between latest stash and its original parent commit:
  # = git diff stash@{0}^! = git diff stash@{0}^ stash@{0}

  git stash show -p
}
