#!/bin/bash

####################################
# Set these variables appropriately
####################################
thesis_dir="/Users/marco/Documents/Github/Thesis"
repo_dir="/Users/marco/Documents/Github/ThesisMeter"
python_bin="/usr/local/opt/python/libexec/bin/python"
# The main thesis file that includes all others
main_thesis_file="$thesis_dir/thesis.tex"
# The data file in which statistics will be appended every day
data_file="$repo_dir/data.csv"
# The path of the figure that will be produced
output_file="$repo_dir/word_count.png"
# Path to the script that plots the results. It's in the repo.
plot_script="$repo_dir/plot_word_count.py"

#Extract the daily data
export d=$(date "+%d/%m/%y")
export count=$(detex "$main_thesis_file" | wc -w | xargs)
echo "$d,$count" >> "$data_file"

#Produce the figures
#Word count figure
#echo $python_bin "$plot_script" "$output_file" 
$python_bin "$plot_script" "$data_file" "$output_file" 

#TODO: word delta figure

#TODO: Figure-count figure

#Commit changes to repo
cd $repo_dir
git add *
git commit -a -m "Daily data update"
git push origin master

echo "ThesisMeter job ran OK!"
