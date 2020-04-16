#!/bin/bash
#Set a PATH manually
export PATH=/usr/local/bin:/usr/local/sbin:~/bin:/usr/local/opt/python/libexec/bin/python:/usr/bin:/bin:/usr/sbin:/sbin:/Library/TeX/texbin/

# Import configurations
source config

#Extract the daily data
export d=$(date "+%d/%m/%y")
export count=$(detex "$MAIN_THESIS_FILE" | wc -w | xargs)
echo "$d,$count" >> "$DATA_FILE"

#Word count figure
python "$PLOT_SCRIPT" "$DATA_FILE" "$FIG_WORD_COUNT" 

#TODO: word delta figure

#TODO: Figure-count figure

#Commit changes to repo
cd $REPO_DIR
git add *
git commit -a -m "Daily data update"
# Push command using user/pwd authentication.
git push --repo https://$GIT_USER:$GIT_PWD@github.com/$GIT_USER/ThesisMeter.git
# Git command using default authentication (works when ssh keys have been setup)
# Use this commmand instead of the one above if you don't feel confortable writing
# your github password in the config file.
# git push origin master

echo "ThesisMeter job ran OK!"
