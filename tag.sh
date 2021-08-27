#!/bin/bash

if [[ $# -ne 6 ]]
then
      echo "Please run this script as follows"
      echo "Usage: ./tag.sh -source_url <URL> -u  <username> -p <password>"
      exit 1
fi
KEYWORD="$1"
URL=$2
USER_KEY="$3"
USERNAME=$4
PASS_KEY="$5"
PASSWORD="$6"
 
dir=`echo "$2" | grep -o '/[^/]*$' | tr -d / | cut -d '.' -f 1`
if [ ! -d "$dir" ] ; then
 git clone $2
else
 cd "$dir"
 git pull "$2"

fi

tag=`git tag`
latest_tag=`git tag |  head -1`

x=`git log --oneline | cut -d ' ' -f1 | wc -l`
count=$["$x"+1]
#echo "$count"
#tag=`git tag`

echo $tag
if [ -z "$tag" ]
then 
	echo "no tags are present"
	echo "now going to tag the version"
	DATE=`date +%d-%m-%Y-%I`
	COMID=`git log --online | cut -d ' ' -f 1 | head -1`
	git tag -a "$DATE"-application-"$count" -m "test commit id for release" $COMID
	git push --tags https://"$4":"$6"@github.com/techylinux/todo.git
else
	echo "tags are present"
	echo "tagging the commit ID with new pattern"
	DATE=`date +%d-%m-%Y-%I`
        COMID=`git log --online | cut -d ' ' -f 1 | head -1`
        git tag -a "$DATE"-application-"$count" -m "test commit id for release" $COMID
        git push --tags https://"$4":"$6"@github.com/techylinux/todo.git

fi
echo "A new tag $latest_tag has been added in GIT repository for master branch"
