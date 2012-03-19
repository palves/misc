# My quilt aliases.  I have finger memory for these by now...

# Source this file from .bashrc* .

# quilt options.

export QUILT_PATCH_OPTS="--unified-reject-files"
export QUILT_REFRESH_ARGS="--diffstat --no-timestamps --no-index --sort -p1 -p ab"
export QUILT_DIFF_ARGS="--no-timestamps --no-index --sort --color=auto -p ab"

# My quilt aliases.  I have finger memory for these by now...

alias qs='quilt series -v | less -R'
alias qt='quilt top'
alias qr='quilt refresh --diffstat'
alias qrs='quilt refresh --diffstat --strip-trailing-whitespace'
alias qpu='quilt push'
alias qpo='quilt pop'
