function c(){
    cd "$(
      find ~  -maxdepth 7 \
      -type d -name node_modules -prune -o \
      -type d -name .git -prune -o \
      -type d -name .cache -prune -o \
      -type d -name _cacache -prune -o \
      -type d -name "*" -print  2>/dev/null |\
      fzf
    )"
}

function cr(){
    cd "$(
      find / -maxdepth 4 \
      -type d -name node_modules -prune -o \
      -type d -name .git -prune -o \
      -type d -name .cache -prune -o \
      -type d -name _cacache -prune -o \
      -type d -name "*" -print 2>/dev/null |\
      fzf
    )"
}

function c.(){
    cd "$(
      find . \
      -type d -name node_modules -prune -o \
      -type d -name .git -prune -o \
      -type d -name .cache -prune -o \
      -type d -name _cacache -prune -o \
      -type d -name "*" -print 2>/dev/null |\
      fzf
    )"
}
