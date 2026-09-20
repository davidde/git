###################################
#         Git shortcuts           #
###################################

def --wrapped g [...args: string] {
    git ...$args
}

def --wrapped ga [...args: string] {
    git add ...$args
}

def gaa [] {
    git add --all
}

def --wrapped gai [...args: string] {
    git add --interactive ...$args
}

def gam [message] {
    # Amend commit; modify commit message, optionally 'git add' files
    git commit --amend -m $message
}

def gama [message] {
    # Amend commit; modify commit message, and add all modified files
    git commit --amend -am $message
}

def gan [] {
    # Amend commit; keep commit message, optionally 'git add' files
    git commit --amend --no-edit
}

def gana [] {
    # Amend commit; keep commit message, and add all modified files
    git commit --amend --no-edit -a
}

def --wrapped gap [...args: string] {
    git add --patch ...$args
}

def --wrapped gb [...args: string] {
    git branch ...$args
}

def gba [] {
    # List all branches
    git branch --all
}

def --wrapped gbd [...args: string] {
    git branch --delete ...$args
}

def --wrapped gbdf [...args: string] {
    git branch --delete --force ...$args
}

def --wrapped gbl [...args: string] {
    git blame ...$args
}

def gbls [] {
    # List all branches
    git branch --all
}

def --wrapped gbs [...args: string] {
    git bisect ...$args
}

def --wrapped gbsb [...args: string] {
    git bisect bad ...$args
}

def --wrapped gbsg [...args: string] {
    git bisect good ...$args
}

def gbsr [] {
    git bisect reset
}

def gbss [] {
    git bisect start
}

def --wrapped gc [...args: string] {
    git commit --verbose ...$args
}

def --wrapped gcam [...args: string] {
    git commit -am ...$args
}

def gcame [] {
    git commit --allow-empty-message -am ""
}

def --wrapped gcamg [...args: string] {
    git commit --gpg-sign -am ...$args
}

def --wrapped gcams [...args: string] {
    git commit --signoff -am ...$args
}

def gcamu [] {
    git commit -am "Update"
}

def --wrapped gcem [...args: string] {
    # Create empty commit for testing CI/CD
    git commit --allow-empty -m ...$args
}

def --wrapped gcf [...args: string] {
    git config ...$args
}

def --wrapped gcfg [...args: string] {
    git config --global ...$args
}

def --wrapped gcfl [...args: string] {
    git config --local ...$args
}

def --wrapped gcfls [...args: string] {
    git config --list ...$args
}

def gcl [url, path?] {
    # Git clone and cd into project
    if ($path != null) {
        git clone --recurse-submodules $url $path
        cd $path
    } else {
        git clone --recurse-submodules $url
        cd ($url | path parse | get stem)
    }
}

def --wrapped gcm [...args: string] {
    git commit -m ...$args
}

def --wrapped gcmg [...args: string] {
    git commit --gpg-sign -m ...$args
}

def --wrapped gcms [...args: string] {
    git commit --signoff -m ...$args
}

def gcnt [] {
    # Count commits on current branch
    git shortlog -sn
    echo "  + ___________________________________"
    echo "    (git rev-list --count HEAD) commits total up to current HEAD"
}

def --wrapped gco [...args: string] {
    git checkout ...$args
}

def --wrapped gcob [...args: string] {
    git checkout -b ...$args
}

def gcobb [] {
    # Checkout previous branch
    git checkout -
}

def gcoc [count = 1] {
    # Checkout child commit
    # Usage: gcoc = gcoc 1 => direct child; gcoc 2 => grandchild
    let children = (git log --all --ancestry-path ^HEAD --format=format:%H | lines)
    if ($children | is-empty) {
        echo "This commit does not have any children, HEAD remains at:"
        git log -1 --oneline
        return
    }

    mut child = ($children | last $count | first)
    if ($children | length) <= $count {
        let branches = (git branch --contains $child | each { |it| $it | str trim | str replace '*' '' } | str join ' ')
        if ($branches | str contains ' ') == false {
            $child = $branches
        }
    }

    git checkout $child
}

def gcod [] {
    git checkout develop
}

def --wrapped gcof [...args: string] {
    git checkout -f ...$args
}

def gcom [] {
    git checkout (git_main_branch)
}

def gcop [count = 1] {
    # Checkout parent commit
    # Usage: gcop = gcop 1 => direct parent; gcop 2 => grandparent
    git checkout $"HEAD~($count)"
}

def --wrapped gcp [...args: string] {
    git cherry-pick ...$args
}

def gcpa [] {
    git cherry-pick --abort
}

def gcpc [] {
    git cherry-pick --continue
}

def gcpq [] {
    git cherry-pick --quit
}

def gcps [] {
    git cherry-pick --skip
}

def --wrapped gd [...args: string] {
    git diff ...$args
}

def --wrapped gds [...args: string] {
    git diff --staged ...$args
}

def --wrapped gdst [...args: string] {
    # Show diff between latest stash and working tree
    git diff 'stash@{0}' ...$args
}

def gdsth [] {
    # Show diff between latest stash and HEAD
    git diff 'stash@{0}' HEAD
}

def gdstp [] {
    # Show diff between latest stash and its parent
    git diff 'stash@{0}^' 'stash@{0}'
}

def --wrapped gf [...args: string] {
    git fetch ...$args
}

def --wrapped gfo [...args: string] {
    git fetch origin ...$args
}

def --wrapped gg [...args: string] {
    # Git graph (all commits)
    git log --graph --all --date=format:"%d/%m/%Y" --format=format:"%C(yellow)%h%Creset%x09%C(dim white)%an%Creset%x09%C(bold green)%D%Creset%n%C(white)%ad%Creset%x09%C(bold)%s%Creset%n" ...$args
}

def --wrapped ggb [...args: string] {
    # Git graph branches
    gg "--simplify-by-decoration" ...$args
}

def --wrapped ggbo [...args: string] {
    # Git graph branches --oneline
    ggo "--simplify-by-decoration" ...$args
}

def --wrapped ggo [...args: string] {
    # Git graph --oneline (all commits)
    git log --graph --all --date=format:"%d/%m/%Y" --format=format:"%C(yellow)%h%Creset   %C(white)%ad%Creset   %C(bold)%s   %C(bold green)%D%Creset%n" ...$args
}

def --wrapped gig [...args: string] {
    # Ignore tracked files
    git update-index --skip-worktree ...$args
}

def --wrapped gug [...args: string] {
    # Unignore files
    git update-index --no-skip-worktree ...$args
}

def glsig [] {
    # List ignored files
    git ls-files -v | where $it =~ '^S'
}

def gl [] {
    # Git log --name-status (defaults to last 10 commits)
    glog 10
}

def glo [] {
    # Git log --oneline
    git log --date=format:"%d/%m/%Y" --format=format:"%C(yellow)%h%Creset   %C(white)%ad%Creset   %C(bold)%s   %C(bold green)%D%Creset"
}

def --wrapped glog [count?: int, ...args: string] {
    # Git log with formatting; defaults to full log, pass count for N commits
    echo ""
    if ($count != null) {
        git log $"-($count)" --reverse --name-status --date=format:"%A %B %d %Y at %H:%M" --format=format:"%C(yellow)%H%Creset%x09%C(bold green)%D%Creset%n%<|(40)%C(white)%ad%x09%an%Creset%n%n    %C(bold)%s%Creset%n%w(0,4,4)%n%-b%n" ...$args
    } else {
        git log --reverse --name-status --date=format:"%A %B %d %Y at %H:%M" --format=format:"%C(yellow)%H%Creset%x09%C(bold green)%D%Creset%n%<|(40)%C(white)%ad%x09%an%Creset%n%n    %C(bold)%s%Creset%n%w(0,4,4)%n%-b%n" ...$args
    }
    echo ""
}

def glsb [] {
    # List all branches
    git branch --all
}

def glsf [] {
    # List tracked files
    git ls-files
}

def glsr [] {
    # List remotes
    git remote -v
}

def glss [] {
    # List submodules
    git config --file .gitmodules --name-only --get-regexp path
}

def --wrapped glsst [...args: string] {
    # List stashes
    git stash list ...$args
}

def --wrapped glst [...args: string] {
    # List tags
    git tag --list ...$args
}

def --wrapped gm [...args: string] {
    git merge ...$args
}

def --wrapped gmnff [...args: string] {
    git merge --no-ff ...$args
}

def gmom [] {
    git merge $"origin/(git_main_branch)"
}

def --wrapped gmsq [...args: string] {
    git merge --squash ...$args
}

def gmum [] {
    git merge $"upstream/(git_main_branch)"
}

def --wrapped gmv [...args: string] {
    git mv ...$args
}

def --wrapped gph [...args: string] {
    git push ...$args
}

def --wrapped gphd [...args: string] {
    # Delete remote branch
    git push --delete ...$args
}

def --wrapped gphdo [...args: string] {
    # Delete branch from origin
    git push --delete origin ...$args
}

def --wrapped gphf [...args: string] {
    git push --force-with-lease ...$args
}

def --wrapped gphff [...args: string] {
    git push --force ...$args
}

def gpht [] {
    git push
    if ($env.LAST_EXIT_CODE == 0) {
        git push --tags
    }
}

def --wrapped gphu [...args: string] {
    # Set upstream branch
    git push -u ...$args
}

def --wrapped gphuo [...args: string] {
    # Set origin as upstream
    git push -u origin ...$args
}

def gphuom [] {
    # Set origin/main as upstream
    git push -u origin main
}

def --wrapped gpl [...args: string] {
    git pull ...$args
}

def --wrapped gpla [...args: string] {
    # Pull with autostash
    git pull --autostash ...$args
}

def --wrapped gplr [...args: string] {
    git pull --rebase ...$args
}

def --wrapped gplrs [...args: string] {
    git pull --recurse-submodules ...$args
}

def --wrapped gr [...args: string] {
    git reset ...$args
}

def --wrapped grh [count, ...args: string] {
    # git reset HEAD
    # Usage: grh 1 => reset HEAD to previous commit; grh 2 => 2 commits back
    git reset $"HEAD~($count)" ...$args
}

def --wrapped grhard [...args: string] {
    # Hard reset (dangerous: removes uncommitted changes)
    git reset --hard ...$args
}

def grhhard [count = 1] {
    # Hard reset HEAD
    grh $count "--hard"
}

def grhk [count = 1] {
    # Keep reset HEAD (aborts if dirty files)
    grh $count "--keep"
}

def grhs [count = 1] {
    # Soft reset HEAD
    grh $count "--soft"
}

def --wrapped grk [...args: string] {
    # Keep reset (safer than --hard; aborted if dirty files)
    git reset --keep ...$args
}

def --wrapped grs [...args: string] {
    # Soft reset
    git reset --soft ...$args
}

def --wrapped grb [...args: string] {
    git rebase ...$args
}

def grbm [] {
    git rebase (git_main_branch)
}

def --wrapped gre [...args: string] {
    git restore ...$args
}

def grea [] {
    # Restore all (throw away uncommitted changes)
    git restore .
}

def greh [path, count = 1] {
    # Restore from HEAD
    git restore $"--source=HEAD~($count)" $path
}

def --wrapped grem [...args: string] {
    git remote ...$args
}

def --wrapped grema [...args: string] {
    # Add remote
    git remote add ...$args
}

def --wrapped gremao [...args: string] {
    # Add origin remote
    git remote add origin ...$args
}

def gremls [] {
    # List remotes
    git remote -v
}

def --wrapped gremrm [...args: string] {
    # Remove remote
    git remote rm ...$args
}

def gremrmo [] {
    # Remove origin
    git remote rm origin
}

def --wrapped gremset [...args: string] {
    # Set remote URL
    git remote set-url ...$args
}

def --wrapped gremseto [...args: string] {
    # Set origin URL
    git remote set-url origin ...$args
}

def --wrapped gremsh [...args: string] {
    git remote show ...$args
}

def gremv [] {
    # List remotes
    git remote -v
}

def --wrapped grl [...args: string] {
    git reflog ...$args
}

def --wrapped grm [...args: string] {
    git rm ...$args
}

def --wrapped gs [...args: string] {
    git status ...$args
}

def --wrapped gsh [...args: string] {
    git show ...$args
}

def gss [] {
    git status --short
}

def --wrapped gst [...args: string] {
    git stash ...$args
}

def --wrapped gsta [...args: string] {
    git stash apply ...$args
}

def --wrapped gstd [...args: string] {
    git stash drop ...$args
}

def --wrapped gstls [...args: string] {
    git stash list ...$args
}

def --wrapped gstph [...args: string] {
    git stash push ...$args
}

def --wrapped gstpp [...args: string] {
    git stash pop ...$args
}

def gstshl [] {
    # Show stash diff
    git stash show -l
}

def gstshp [] {
    # Show stash patch
    git stash show -p
}

def --wrapped gsub [...args: string] {
    git submodule ...$args
}

def --wrapped gsuba [...args: string] {
    git submodule add ...$args
}

def --wrapped gsubi [...args: string] {
    # Initialize submodules
    git submodule update --init ...$args
}

def --wrapped gsubf [...args: string] {
    git submodule foreach ...$args
}

def gsubfpl [] {
    git submodule foreach git pull
}

def gsubfplom [] {
    git submodule foreach git pull origin (git_main_branch)
}

def --wrapped gsubs [...args: string] {
    git submodule status ...$args
}

def --wrapped gsubu [...args: string] {
    # Update submodules
    git submodule update --remote --merge ...$args
}

def --wrapped gt [...args: string] {
    git tag ...$args
}

def --wrapped gtam [...args: string] {
    # Annotated tag with message
    git tag -am ...$args
}

def --wrapped gtd [...args: string] {
    git tag --delete ...$args
}

def --wrapped gtls [...args: string] {
    git tag --list ...$args
}

def --wrapped gtsm [...args: string] {
    # GPG signed tag
    git tag -sm ...$args
}


########################################
#         Git Utility Functions        #
########################################

def git_main_branch [] {
    # Check if main branch exists, otherwise use master branch
    let branches = (git branch --list main | lines)
    if ($branches | length) > 0 {
        "main"
    } else {
        "master"
    }
}
