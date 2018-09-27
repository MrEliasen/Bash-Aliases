# Use at your own risk

# Utility aliases
alias lsa="ls -lA"
alias cd..="cd .."
alias o-hosts="sudo vim /etc/hosts"
alias shtop="sudo htop"
o () {
    LOCATION=".";
    if [ ! -z "$1" ]; then
        LOCATION="$1"
    fi;

    open $LOCATION
}

# Helpful bits
alias myip="curl http://ipecho.net/plain; echo"
alias mylocalip="ipconfig getifaddr en0"
alias temp="macstats" # Needs: npm i macstats -g
alias dspace="du -sh * | sort -h"

# Git aliases
alias ga="git add ."
gpush () {
    BRANCH="master";
    if [ ! -z "$1" ]; then
        BRANCH="$1"
    fi;

    git push -u origin $BRANCH
}
gc () {
    git commit -m "$1"
}
# will loop all first level directories, ga, gc and gpush in them all.
gpushall () {
    for dir in ./*; do (cd "$dir" && ga && gc "$1" && gpush); done
}

# Apache & PHP (MacOS)
alias o-php="sudo vim /private/etc/php.ini"
alias o-vhost="sudo vim /private/etc/apache2/extra/httpd-vhosts.conf"
alias o-httpd="sudo vim /private/etc/apache2/httpd.conf"
alias a-rs="sudo apachectl restart"
alias a-sp="sudo apachectl stop"
alias a-st="sudo apachectl start"
alias a-ct="sudo apachectl configtest"
# If you want a bit more control
apache () {
    sudo apachectl $1
}

# Docker
docker-clear () {
    echo "Are you dure you want to delete all docker containers? (y/n, default n)";
    read removeAll;

    if [ "$removeAll" = "y" ] || [ "$removeAll" = "Y" ]; then
        docker rm $(docker ps -q -f status=exited)
        echo "Containers deleted."
    fi;
}