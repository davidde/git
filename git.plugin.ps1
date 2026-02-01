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

function gam {
  # Amend commit; modify commit message, optionally 'git add' files:

  param ($message)
  git commit --amend -m $message
}

function gama {
  # Amend commit; modify commit message, and add all modified files:

  param ($message)
  git commit --amend -am $message
}

function gan {
  # Amend commit; keep commit message, optionally 'git add' files:

  git commit --amend --no-edit
}

function gana {
  # Amend commit; keep commit message, and add all modified files:

  git commit --amend --no-edit -a
}

function gap {
  git add --patch @args
}

function gb {
  git branch @args
}

function gba {
  # List all branches:

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

function gbls {
  # List all branches:

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

function gcem {
  # Create a commit without any changes, e.g. for testing CI/CD:
  # E.g. git commit --allow-empty -m "Triggering build"

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

function gcl {
  # Git clone and cd into project:

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

function gcnt() {
  # Count the number of commits on a branch:

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


function gcobb {
  # "git checkout branch before":
  # Checkout the branch you were on right before switching to the current one

  git checkout -
}

function gcoc() {
  # Checkout a child (younger) commit:
  # Usage: gcoc [<number of commits after HEAD>]
  #   E.g. gcoc = gcoc 1   => checks out direct child
  #               gcoc 2   => checks out grandchild

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

function git_main_branch() {
  # Check if main branch exists, otherwise use master branch:

  if (git branch --list main) {
    "main"
  } else {
    "master"
  }
}

function gcom {
  git checkout $(git_main_branch)
}

function gcop() {
  # Checkout a parent (older) commit:
  # Usage: gcop [<number of commits before HEAD>]
  #   E.g. gcop = gcop 1   => checks out direct parent
  #               gcop 2   => checks out grandparent

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

function gdst {
  # Show the diff between latest stash and local working tree:
  # = git stash show -l:

  git --no-pager diff 'stash@{0}' @args
}

function gdsth {
  # Show the diff between latest stash and HEAD:

  git --no-pager diff 'stash@{0}' HEAD
}

function gdstp {
  # Show the diff between latest stash and its original parent commit:
  # = git stash show -p

  git --no-pager diff 'stash@{0}^' 'stash@{0}'
}

function gf {
  git fetch @args
}

function gfo {
  git fetch origin @args
}

function gg {
  # git graph (all commits):

  git --no-pager log --graph --all --date=format:"%d/%m/%Y" --format=format:"%C(yellow)%h%Creset%x09%C(dim white)%an%Creset%x09%C(bold green)%D%Creset%n%C(white)%ad%Creset%x09%C(bold)%s%Creset%n" @args
}

function ggb {
  # git graph branches:

  gg --simplify-by-decoration
}

function ggbo {
  # git graph branches --oneline:

  ggo --simplify-by-decoration
}

function ggo {
  # git graph --oneline (all commits):

  git --no-pager log --graph --all --date=format:"%d/%m/%Y" --format=format:"%C(yellow)%h%Creset   %C(white)%ad%Creset   %C(bold)%s   %C(bold green)%D%Creset%n" @args
}

function gig {
  # Ignore already tracked files:

  git update-index --skip-worktree @args
}

function gunig {
  # Unignore ignored files:

  git update-index --no-skip-worktree @args
}

function glsig {
  # List ignored files:

  git ls-files -v | Select-String "^S"
}

# Remove the builtin powershell `gl`:
# (Alias for Get-Location)
Remove-Item -Path Alias:gl -Force

function gl {
  # "git log --name-status" that always defaults to 10 commits:

  glog -10
}

function glo {
  # "git log --oneline":

  git --no-pager log --date=format:"%d/%m/%Y" --format=format:"%C(yellow)%h%Creset   %C(white)%ad%Creset   %C(bold)%s   %C(bold green)%D%Creset"
}

function glog {
  # "git log" that defaults to full commit log when no args are provided;
  # but allows passing `-[number]` to get a specific amount of commits

  param ($num)
  Write-Output ""
  git --no-pager log $num --reverse --name-status --date=format:"%A %B %d %Y at %H:%M" --format=format:"%C(yellow)%H%Creset%x09%C(bold green)%D%Creset%n%<|(40)%C(white)%ad%x09%an%Creset%n%n    %C(bold)%s%Creset%n%w(0,4,4)%n%-b%n" @args
  # %w(0,4,4): no line-wrap, indent first line 4 chars, subsequent lines also 4 lines
  Write-Output ""
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

# Remove the builtin powershell `gm`:
# (Alias for Get-Member)
Remove-Item -Path Alias:gm -Force

function gm {
  git merge @args
}

# Try to merge origin/main into the currently active branch:
function gmom {
  git merge "origin/$(git_main_branch)"
}

# Try to merge upstream/main into the currently active branch:
function gmum {
  git merge "upstream/$(git_main_branch)"
}

function gmv {
  git mv @args
}

function gph {
  git push @args
}

function gphd {
  # Delete a branch from a remote:
  # Usage: gphd origin feat-branch

  git push --delete @args
}

function gphdo {
  # Delete a branch from the origin remote:
  # Usage: gphdo feat-branch

  git push --delete origin @args
}

function gphf {
  git push --force-with-lease @args
}

function gphff {
  git push --force @args
}

function gpht {
  git push
  if ($?) {
    git push --tags
  }
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

function gpla {
  # Stash "dirty" uncommitted changes, do git pull, and pop
  # the uncommitted changes back out after pull completes:

  git pull --autostash @args
}

function gplr {
  git pull --rebase @args
}

function gplrs {
  git pull --recurse-submodules @args
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

function gremls {
  # List all remotes:

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
