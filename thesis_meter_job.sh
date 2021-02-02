#!/bin/bash
#Set a PATH manually
export PATH=/usr/local/opt/python/libexec/bin/:/usr/local/bin:/usr/local/sbin:~/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Library/TeX/texbin/

# Import configurations
export REPO_DIR="/Users/marco/Documents/Github/PhD/ThesisMeter"
cd $REPO_DIR
source config

#Extract the daily data
pushd $THESIS_DIR
export d=$(date "+%Y-%m-%d")
export count=$(detex "$MAIN_THESIS_FILE" | wc -w | xargs)
popd
echo "$d,$count" >> "$DATA_FILE"

#Word count figure
python "$PLOT_WORD_COUNT" "$DATA_FILE" "$FIG_WORD_COUNT" 

#TODO: word delta figure

#TODO: Figure-count figure

#Commit changes to repo
git add *
git commit -a -m "Daily data update"
# Push command using user/pwd authentication.
git push --repo https://$GIT_USER:$GIT_PWD@github.com/$GIT_USER/ThesisMeter.git
# Git command using default authentication (works when ssh keys have been setup)
# Use this commmand instead of the one above if you don't feel confortable writing
# your github password in the config file.
# git push origin master

echo "$(date) - ThesisMeter job ran OK!"
echo ""
