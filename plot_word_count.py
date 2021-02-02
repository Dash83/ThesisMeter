import pandas as pd
import matplotlib.pyplot as plt
import sys
import os.path
import numpy as np
import calendar

def usage():
    print("python plot_word_count.py DATA_FILE OUTPUT_FILE")

def main(data_file, output_file):
    ds = pd.read_csv(data_file)

    #Calculations to display only months in the xticks
    dates = pd.to_datetime( ds["Date"])
    num_entries = len(dates)
    months = dates.dt.month
    months = months.apply(lambda x: calendar.month_abbr[x]).unique()    
    num_months = len(months)
    step = num_entries / num_months
    ticks = np.arange(0, num_entries, step=step)

    x_axis=ds.axes[1][0]
    y_axis=ds.axes[1][1]
    
    # Prepare the axes
    plt.xticks(ticks, months, rotation=45)
    plt.xlabel('Time')
    plt.ylabel(y_axis)
    plt.grid(axis='y')
    
    # Plot the data
    plt.plot(ds[x_axis], ds[y_axis])

    # Save the figure
    plt.savefig(output_file)

if __name__ == "__main__":
    if len(sys.argv) < 3:
        print("Insufficient arguments.")
        usage()
        sys.exit()
 
    data_file=os.path.normpath(sys.argv[1])
    output_file=os.path.normpath(sys.argv[2])
    #print(data_file)
    #print(output_file)
    main(data_file, output_file)
    
