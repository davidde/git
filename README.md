# oh-my-zsh git plugin
This plugin is a complete replacement for the default oh-my-zsh git plugin,
and provides quite a few useful aliases and functions.
The motivation to replace the default plugin stems from the fact
that it comes with some inconsistencies that make a few popular commands
rather unintuitive:
* `gcm='git checkout master'`: this is inconsistent with `gco='git checkout'`,  
 and on top of that it steals what should be the shortcut for `git commit -m`.
* Similar issues with `git log`: half of the commands use `glg`, the other half `gl`,  
  but `gl` by itself is `git pull` (!?), for which `gpl` would make more sense.
* ...

The efficiency of these shortcuts is kind of lost when you have to remember
different letters for the same subcommand depending on the parameter(s)
you're using ...

In this plugin, great care care is taken to make sure all aliases are the most
intuitive they can possibly be.


## Installation
To use this plugin, clone this repo to `~/.oh-my-zsh/custom/plugins`:
```
git clone https://github.com/davidde/git.git ~/.oh-my-zsh/custom/plugins/git
```
This will automatically override the default git plugin.
If you aren't yet using the default plugin,  
add `git` to the plugins in your `~/.zshrc` file:
```
plugins=(git)
```


## Aliases

| Alias           | Command                                                   |
|:----------------|:----------------------------------------------------------|
| **g**           | git                                                       |
| **ga**          | git add                                                   |
| **gaa**         | git add --all                                             |
| **galias**      | git_list_aliases                                          |
| **gam**         | **g**it commit --**a**mend -**m**                         |
| **gama**        | **g**it commit --**a**mend -**m** --**a**ll               |
| **gan**         | **g**it commit --**a**mend --**n**o-edit                  |
| **gana**        | **g**it commit --**a**mend --**n**o-edit --**a**ll        |
| **gb**          | git branch                                                |
| **gba**         | git branch --all                                          |
| **gbd**         | git branch --delete                                       |
| **gbdf**        | git branch --delete --force                               |
| **gbl**         | git blame                                                 |
| **gbll**        | git_blame_line *\<file> [\<from line>] [\<to line>]*      |
| **gbls**        | git branch --list \| cat                                  |
| **gbs**         | git bisect                                                |
| **gbsb**        | git bisect bad                                            |
| **gbsg**        | git bisect good                                           |
| **gbsr**        | git bisect reset                                          |
| **gbss**        | git bisect start                                          |
| **gc**          | git commit --verbose                                      |
| **gcam**        | git commit -am                                            |
| **gcamg**       | git commit -am --gpg-sign                                 |
| **gcams**       | git commit -am --signoff                                  |
| **gcf**         | git config                                                |
| **gcfl**        | git config --list                                         |
| **gcfls**       | git config --list \| cat                                  |
| **gcl**         | git clone --recurse-submodules                            |
| **gcm**         | git commit -m                                             |
| **gcmg**        | git commit -m --gpg-sign                                  |
| **gcms**        | git commit -m --signoff                                   |
| **gcnt**        | git_count                                                 |
| **gcnta**       | git_count_all                                             |
| **gco**         | git checkout                                              |
| **gcob**        | git checkout -b                                           |
| **gcoc**        | git_checkout_child                                        |
| **gcod**        | git checkout develop                                      |
| **gcom**        | git checkout master                                       |
| **gcop**        | git_checkout_parent                                       |
| **gcp**         | git cherry-pick                                           |
| **gcpa**        | git cherry-pick --abort                                   |
| **gcpc**        | git cherry-pick --continue                                |
| **gd**          | git diff                                                  |
| **gds**         | git diff --staged                                         |
| **gdst**        | git diff stash@{0}                                        |
| **gdsth**       | git diff stash@{0} HEAD                                   |
| **gdstp**       | git diff stash@{0}^ stash@{0}                             |
| **gf**          | git fetch                                                 |
| **gfo**         | git fetch origin                                          |
| **ggb**         | "git graph branches"                                      |
| **gl**          | git log --name-status                                     |
| **glf**         | git_log_file *\<file> [\<from line>] [\<to line>]*        |
| **glg**         | git log --graph                                           |
| **glgo**        | git log --graph --oneline                                 |
| **glgs**        | git log --graph --stat                                    |
| **glo**         | git log --oneline                                         |
| **gloc**        | git_loc *\<Line-of-Code> [\<file>]*                       |
| **glog**        | git log                                                   |
| **glr**         | git log --reverse --name-status                           |
| **gls**         | git ls-files                                              |
| **gm**          | git merge                                                 |
| **gmom**        | git merge origin/master                                   |
| **gmum**        | git merge upstream/master                                 |
| **gmv**         | git mv                                                    |
| **gp**          | git push                                                  |
| **gpd**         | git push --delete                                         |
| **gpdo**        | git push --delete origin                                  |
| **gpf**         | git push --force-with-lease                               |
| **gpt**         | git push && git push --tags                               |
| **gpl**         | git pull                                                  |
| **gplr**        | git pull --rebase                                         |
| **gplrs**       | git pull --recurse-submodules                             |
| **gr**          | git reset                                                 |
| **grhard**      | git reset --hard                                          |
| **grk**         | git reset --keep                                          |
| **grs**         | git reset --soft                                          |
| **grh**         | git_reset_head                                            |
| **grhhard**     | git_reset_head --hard                                     |
| **grhk**        | git_reset_head --keep                                     |
| **grhs**        | git_reset_head --soft                                     |
| **grb**         | git rebase                                                |
| **grbm**        | git rebase master                                         |
| **grem**        | git remote                                                |
| **grema**       | git remote add                                            |
| **gremset**     | git remote set-url                                        |
| **gremsh**      | git remote show                                           |
| **gremv**       | git remote -v                                             |
| **grl**         | git reflog                                                |
| **grm**         | git rm                                                    |
| **gs**          | git status                                                |
| **gsh**         | git show                                                  |
| **gshsf**       | git_show_stash_file *\<file> [\<stash number>]*           |
| **gss**         | git_status_short                                          |
| **gst**         | git stash                                                 |
| **gsta**        | git stash apply                                           |
| **gstd**        | git stash drop                                            |
| **gstl**        | git stash list                                            |
| **gstls**       | git stash list \| cat                                     |
| **gstp**        | git stash pop                                             |
| **gstsl**       | git stash show -l                                         |
| **gstsp**       | git stash show -p                                         |
| **gsubi**       | git submodule update --init                               |
| **gsubu**       | git submodule update --remote --merge                     |
| **gt**          | git tag                                                   |
| **gtam**        | git tag -am                                               |
| **gtsm**        | git tag -sm                                               |
| **gtd**         | git tag --delete                                          |
| **gtl**         | git tag --list                                            |
| **gtls**        | git tag --list \| cat                                     |
| **gwch**        | git whatchanged -p                                        |

&nbsp;

> :warning: **Note:**  
> The commands above are optimized for memorability,  
> and may not correspond exactly with the actual alias implementation.

Check out usage, clarifications and alias/function implementation in
your local [git.plugin.zsh](./git.plugin.zsh) or the
[repo's source](https://github.com/davidde/git/blob/master/git.plugin.zsh).

