#!/bin/bash
#Set a PATH manually
export PATH=/usr/local/bin:/usr/local/sbin:~/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Library/TeX/texbin/:/usr/local/opt/python/libexec/bin/

# Import configurations
source config

#Extract the daily data
export d=$(date "+%d/%m/%y")
export count=$(detex "$MAIN_THESIS_FILE" | wc -w | xargs)
echo "$d,$count" >> "$DATA_FILE"

#Produce the figures
#Word count figure
#echo $python_bin "$plot_script" "$output_file" 
python "$PLOT_SCRIPT" "$DATA_FILE" "$FIG_WORD_COUNT" 

#TODO: word delta figure

#TODO: Figure-count figure

#Commit changes to repo
cd $REPO_DIR
git add *
git commit -a -m "Daily data update"
#git push origin master
git push --repo https://$GIT_USER:$GIT_PWD@github.com/$GIT_USER/ThesisMeter.git

echo "ThesisMeter job ran OK!"
