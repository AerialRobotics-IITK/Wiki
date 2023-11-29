# GitCheatsheet

#### Git

## Git Cheat Sheet English

#### Index

* [Commit History](git\_cheatsheets.md#commit-history)
* [Move / Rename](git\_cheatsheets.md#move-rename)
* [Branches & Tags](git\_cheatsheets.md#branches-and-tags)
* [Merge & Rebase](git\_cheatsheets.md#merge-and-rebase)
* [Undo](git\_cheatsheets.md#undo)

***

### Search

**A text search on all files in the directory:**

```
$ git grep "Hello"
```

**Show commits that introduced a specific keyword**

```
$ git log -S 'keyword'
```

**Show commits that introduced a specific keyword (using a regular expression)**

```
$ git log -S 'keyword' --pickaxe-regex
```

***

### Commit History

**Show all commits, starting with newest (it'll show the hash, author information, date of commit and title of the commit):**

```
$ git log
```

**Show changes over time for a specific file:**

```
$ git log -p <file>
```

**Display commits that are present only in remote/branch in right side**

```
$ git log --oneline <origin/master>..<remote/master> --left-right
```

**Who changed, what and when in \<file>:**

```
$ git blame <file>
```

***

### Move / Rename

**Rename a file:**

Rename Index.txt to Index.html

```
$ git mv Index.txt Index.html
```

***

### Branches & Tags

**List all local branches:**

```
$ git branch
```

**List local/remote branches**

```
$ git branch -a
```

**List all remote branches:**

```
$ git branch -r
```

**Switch HEAD branch:**

```
$ git checkout <branch>
```

**Checkout single file from different branch**

```
$ git checkout <branch> -- <filename>
```

**Create and switch new branch:**

```
$ git checkout -b <branch>
```

**Switch to the previous branch, without saying the name explicitly:**

```
$ git checkout -
```

**Create a new branch from an exiting branch and switch to new branch:**

```
$ git checkout -b <new_branch> <existing_branch>
```

**Checkout and create a new branch from existing commit**

```
$ git checkout <commit-hash> -b <new_branch_name>
```

**Create a new branch based on your current HEAD:**

```
$ git branch <new-branch>
```

**Create a new tracking branch based on a remote branch:**

```
$ git branch --track <new-branch> <remote-branch>
```

**Delete a local branch:**

```
$ git branch -d <branch>
```

**Rename current branch to new branch name**

```shell
$ git branch -m <new_branch_name>
```

**Force delete a local branch:**

_You will lose unmerged changes!_

```
$ git branch -D <branch>
```

**Apply specific commit from another branch:**

```
git cherry-pick <commit hash>
```

```
##### List all tags:
```

$ git tag

```
##### List all tags with their messages (tag message or commit message if tag has no message):
```

$ git tag -n

```
<hr>

## Update & Publish

##### List all current configured remotes:
```

$ git remote -v

```
##### Show information about a remote:
```

$ git remote show

```
##### Add new remote repository, named &lt;remote&gt;:
```

$ git remote add

```
##### Rename a remote repository, from &lt;remote&gt; to &lt;new_remote&gt;:
```

$ git remote rename \<new\_remote>

```
##### Remove a remote:
```

$ git remote rm

```
<em><sub>Note: git remote rm does not delete the remote repository from the server. It simply removes the remote and its references from your local repository.</sub></em>

##### Download all changes from &lt;remote&gt;, but don't integrate into HEAD:
```

$ git fetch

```
##### Download changes and directly merge/integrate into HEAD:
```

$ git remote pull

```
##### Get all changes from HEAD to local repository:
```

$ git pull origin master

```
##### Get all changes from HEAD to local repository without a merge:
```

$ git pull --rebase

```
##### Publish local changes on a remote:
```

$ git push

```
##### Delete a branch on the remote:
```

$ git push : (since Git v1.5.0)

```
OR
```

$ git push --delete (since Git v1.7.0)

```
##### Publish your tags:
```

$ git push --tags

````
<hr>

#### Configure the merge tool globally to meld (editor)
```bash
$ git config --global merge.tool meld
````

**Use your configured merge tool to solve conflicts:**

```
$ git mergetool
```

### Merge & Rebase

**Merge branch into your current HEAD:**

```
$ git merge <branch>
```

**List merged branches**

```
$ git branch --merged
```

**Rebase your current HEAD onto \<branch>:**\


_Don't rebase published commit!_

```
$ git rebase <branch>
```

**Abort a rebase:**

```
$ git rebase --abort
```

**Continue a rebase after resolving conflicts:**

```
$ git rebase --continue
```

**Use your editor to manually solve conflicts and (after resolving) mark file as resolved:**

```
$ git add <resolved-file>
```

```
$ git rm <resolved-file>
```

**Squashing commits:**

```
$ git rebase -i <commit-just-before-first>
```

Now replace this,

```
pick <commit_id>
pick <commit_id2>
pick <commit_id3>
```

to this,

```
pick <commit_id>
squash <commit_id2>
squash <commit_id3>
```

***

### Undo

**Discard all local changes in your working directory:**

```
$ git reset --hard HEAD
```

**Get all the files out of the staging area(i.e. undo the last `git add`):**

```
$ git reset HEAD
```

**Discard local changes in a specific file:**

```
$ git checkout HEAD <file>
```

**Revert a commit (by producing a new commit with contrary changes):**

```
$ git revert <commit>
```

**Reset your HEAD pointer to a previous commit and discard all changes since then:**

```
$ git reset --hard <commit>
```

**Reset your HEAD pointer to a remote branch current state.**

```
$ git reset --hard <remote/branch> e.g., upstream/master, origin/my-feature
```

**Reset your HEAD pointer to a previous commit and preserve all changes as unstaged changes:**

```
$ git reset <commit>
```

**Reset your HEAD pointer to a previous commit and preserve uncommitted local changes:**

```
$ git reset --keep <commit>
```

**Remove files that were accidentally committed before they were added to .gitignore**

```
$ git rm -r --cached .
$ git add .
$ git commit -m "remove xyz file"
```

***
