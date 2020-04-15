import pandas as pd
import matplotlib.pyplot as plt
import sys
import os.path

def usage():
    print("python plot.py DATA_FILE OUTPUT_FILE")

def main(data_file, output_file):
    ds = pd.read_csv(data_file)
    x_axis=ds.axes[1][0]
    y_axis=ds.axes[1][1]
    plt.plot(ds[x_axis], ds[y_axis])
    plt.xticks(rotation=45)
    plt.xlabel(x_axis)
    plt.ylabel(y_axis)
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
    
