#!/bin/bash -x
admin_list=(yuanqi.xhf hudson root admin condor jiyu.hyx fufeng.syd)
owner=$(cat /etc/obvos_owner 2>/dev/null)
who=`whoami`

allow=0
test $who '==' $owner && allow=1
test $allow '==' 0 && {
    for name in ${admin_list[@]}
    do
        test $name '==' $who && {
		    test $SSH_TTY '!=' "" && /usr/bin/echo -e "\e[36m欢迎您管理员 $who ，当前机器属于 $owner\e[0m" 1>&2
			allow=1
			break
	    }
    done
}

test $allow '==' 0  && {
    test $who '==' guest && {
	    test $SSH_TTY '!=' "" && /usr/bin/echo -e "\e[36m您正以访客账户登录 $owner 的环境，请注意保护他人隐私\e[0m" 1>&2
	    allow=1
	}
}

test $allow '==' 0 && /usr/bin/echo -e "\e[31m$who 您未被$owner授权访此机器，您可以尝试使用ob-ssh以访客身份访问此机器，如有疑问请联系系统管理员确认\e[0m" 1>&2 && /bin/usleep 300000 && exit 1
