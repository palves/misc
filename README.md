# Misc

Pedro's miscellaneous handy scripts.

- ```core-dispatcher/core-dispatcher```

A kernel.core_pattern script that decides where the core file will go
depending on the cwd of the program that crashed.  This is useful if
for example, you want all cores to go to /tmp, except cores for
programs that run inside some directory, like the GDB testsuite.

- ```dejagnu/deja-color```

Colorize a DejaGnu sum unified diff.  Regressions are displayed in
red, progressions in green.

- ```dejagnu/deja-diff```

Diff two DejaGnu sum files, and run the output through
```deja-color``` for colorization.

- ```gdb/signals.gdb```

Adds a useful "info signal-dispositions" command to GDB, a command
that lists signal dispositions.

- ```gerrit/gerrit-restore```

Batch-restore a series of abandoned Gerrit changes.

- ```git/git-branch-sort```

Sort git branches by last modified date.  Very helpful to find that
branch I was working on recently.

- ```git/git-branch-status```

Find the commits delta between two branches, or between current branch
and another branch.

- ```git/git-contribs```

Shows the git repo's top contributors.

- ```git/git-fix-date```

Reset the top commit's date.

- ```git/git-initial-rev```

Find the repo's initial commit's hash.

- ```git/git-initial-rev-blame```

- ```git/git-old-gdb-branches```

- ```git/git-push-gdb```

Helper to push to upstream GDB master.

- ```git/git-show-gnu```
- ```git/git-tracks```

Show what remote branch the current branch is tracking.

- ```git/git-upstream-update```

Pull from upstream GDB, and push to github.

- ```git/git-who```

Sort committers by number of commits.

- ```patchwork/pwupdate-already-pushed```

Patchwork helper that automatically marks patches whose subject says
"commit", "pushed", or "fyi" as 'Committed'.

- ```quilt/quilt.sh```

My quilt aliases.

- ```stgit/gd```

I use this _all the time_.  It basically shows me what the current
commit would look like if I did "stg refresh".  Shows the difference
between the current checkout and the previous commit (including
unstaged stages).

- ```stgit/ssd```

Shorthand for "series series -d".  Another one that I use all the
time.

- ```stgit/stg-branch-backup```

Like 'stg branch --clone', but stays in the current branch.  I use
this quite often to back up the current state of the branch I'm
working on, before doing more invasive destructive changes (involving
reordering or squashing patches, for example).

- ```stgit/stg-branch-raw-list```

Like 'stg branch --list', but print only the branch names.

- ```stgit/stg-branch-rename```

Like 'stg branch --rename', but allows renaming the current branch.

- ```stgit/stg-branch-sort```

Like git-branch-sort (list branches in last-worked-on chronological
order), but filter out internal stgit branches.  I.e., the branch
listed at the bottom will be the branch you were working on last
night... ;-)

- ```stgit/stg-defresh-top```

Transfers all hunks from the top patch, into the workspace.  I used to
use this for splitting patches, but I no longer do.

- ```stgit/stg-delete-top```

Delete the current top patch.  Nowadays you can use ```stg delete
-t``` instead.

- ```stgit/stg-move-to-end```

Simple stgit helper script that moves a given patch to the end of the
whole series.

- ```stgit/stg-rebase-upstream```

Fetch from GDB upstream and rebase on top of upstream master.

- ```stgit/stg-refresh```

Run "stg refresh" and then run "git diff --check" to show trailing #
whitespace, etc.

- ```stgit/stg-series-hash```

Like 'stg series', but also shows each patch's git hash.  Nowadays you
can do ```stg series -i``` instead.

- ```stgit/stg-squash-next```

Simple `stg squash' wrapper that simplifies squashing the current
patch with the next.
