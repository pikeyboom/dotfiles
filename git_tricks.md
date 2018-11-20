## `git filter-branch` commands

### Case: Migrate sub-directory from one git repo into it's own git repo
```bash
$ git filter-branch [-f] --prune-empty --subdirectory-filter <subdirectory> @
```
Note: '@' is current branch (or head).

### Case: Remove file and history from source tree
```bash
$ git filter-branch -f --prune-empty --index-filter 'git rm -rf --cached --ignore-unmatch <dir>' @
```

### Case: Remove all but single directory from source tree
```bash
$ git filter-branch [-f] --prune-empty --index-filter 'git ls-files | egrep -v "^<dir>/*" | \
            xargs git rm -rf --cached --ignore-unmatch' @
```
Note: Change regex expression to include other folders if necessary (i.e., `"^dir1/*|^dir2/*|...")

### Case: Remove all empty merge commits
```bash
$ git filter-branch --prune-empty --parent-filter \
            'sed "s/-p //g" | xargs -r git show-branch --independent | sed "s/\</-p /g"'
```

Note: Pipe error and standard output to /dev/null to clean up output. Append 
commands with `; true` to let filter-branch commands continue if files are 
not found. 

## References
[Understanding Git Filter-branch and the Git Storage Model](https://manishearth.github.io/blog/2017/03/05/understanding-git-filter-branch/)
