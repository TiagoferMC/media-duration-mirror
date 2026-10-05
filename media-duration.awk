#!/usr/bin/env -S awk -F': ' -f

# Meant to be used alongside the mediainfo.zsh script within this same directory
#
# Expects files with names "N - Title.ext" where N is an integer

/Name/ {
    match($2, /.*\//)
    path = substr($2, RSTART, RLENGTH)
    if (path != ppath) {
        printf "%s\n", path
        ppath = path
    }

    sub(path, "", $2)               # remove path

    match($2, /^[0-9]*/)
    num = substr($2, RSTART, RLENGTH)

    sub(num, "", $2)                # remove num
    sub(/\.\w+$/, "", $2)           # remove extensionn
    sub(/^[ -:]+/, "", $2)          # remove any dashes or colons from the start
    sub(/[-:]+.*/, "", $2)          # same as above but second occurannce and
                                    # everything afterwardss
    name = substr($2, 1, 20)
    if (name != $2)
        name = name"..."

    printf num "|" name "|"
}
/Duration/ {
    c++
    match($2, /[0-9]+/)
    ms=substr($2, RSTART, RLENGTH)
    dms = ms  - pms
    pms = ms

    if (dms >= 0)
        sign = "+"
    else {
        sign = "-"
        dms = -dms
    }

    s   = ms  / 1000
    ds  = dms / 1000
    m   = s   / 60
    dm  = ds  / 60
    h   = m   / 60
    dh  = dm  / 60

    ms  = ms  % 1000
    dms = dms % 1000
    s   = s   % 60
    ds  = ds  % 60
    m   = m   % 60
    dm  = dm  % 60
    h   = h   % 60
    dh  = dh  % 60


    printf "%02d:%02d:%02d.%03d", h, m, s, ms
    if (c == 1) {
        print ""
        next
    }
    printf "|(%s%02d:%02d:%02d.%03d)\n", sign, dh, dm, ds, dms
}

