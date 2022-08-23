#!/bin/bash
[[ $USER != $(whoami) ]] && return 0
export DEP_CACHE_DIR=/.vos/.dep_cache
function _absdownload
{
	    . /home/a/dep_create/bin/absdownload.sh
}

function _absinstall
{
    . /home/a/dep_create/bin/absinstall.sh
}

function _absconfig
{
    . /home/a/dep_create/bin/absconfig.sh
}
function sw
{
    . /home/a/dep_create/bin/sw.sh
}

function orig_dep_create
{
    . /home/a/dep_create/bin/dep_create.sh
}

function dep_create
{
    if [[ "$DEP_CACHE_DIR" == "" ]]
    then
        orig_dep_create "$@"
        return $?
    fi

    # check deps file name
    FILE=$1
    if [[ ! -f $FILE ]]
    then
        FILE=$1.deps
    fi

    MD5=$(md5sum $FILE | cut -d' ' -f1)
    TARGET=$DEP_CACHE_DIR/$MD5
    CURTARGET=$(readlink -n .dep_create)
    echo "==>> DEP_CACHE ENABLED <<=="
    echo "CURTARGET: $CURTARGET "
    echo "   TARGET: $TARGET"
    # target equals cur, and cur exist
    if [[ "$CURTARGET" == "$TARGET" ]] && [[ -d "$TARGET" ]]
    then
        echo "==>> CACHE HITTED, DEP CREATE SUCCESS <<=="
        return 0
    fi


    ret=0
    rm -rf .dep_create
    if [[ -d $TARGET ]]
    then
        ln -sT $TARGET .dep_create && touch $TARGET
        echo "==>> CACHE HITTED, DEP CREATE SUCCESS <<=="
    else
        TMP_DEP_DIR="${TARGET}_$(cat /proc/sys/kernel/random/uuid)"
        echo TMPDIR=$TMP_DEP_DIR

        count=1
        while [ $count -le 2 ]; do
            tfile=$(mktemp)
            orig_dep_create "$@" | tee $tfile || return 2
            if grep "Download failed" $tfile; then
                echo "failed to create dep, count=$count"
                rm -rf .dep_create
                rm -rf $TMP_DEP_DIR
            else
                count=10
                break
            fi
            count=$((count + 1))
            rm -rf $tfile
        done

        if [ $count -eq 10 ];then
            [[ -d $TARGET ]] || (mv .dep_create $TMP_DEP_DIR && chmod 775 $TMP_DEP_DIR)
            [[ -d $TARGET ]] || mv $TMP_DEP_DIR $TARGET
            ln -sT $TARGET .dep_create
        else
            echo "create deps failed more than 3 tiems, exit"
            ret=10
        fi
    fi
    return $ret
}
if [ -n "$BASH_VERSION" ]; then
    export -f orig_dep_create
    export -f dep_create
    export -f _absdownload
    export -f _absinstall
    export -f _absconfig
fi
