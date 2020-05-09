import subprocess
import os
import sys
import re
import csv
import numpy as np
import matplotlib.pyplot as plt


if __name__ == '__main__':
    # \\ are removed from path when calling subprocess
    dir_path = "C:\\\\Users\\\\skhr1\\\\Documents\\\\Script\\\\Root\\\\Test\\\\"
    # confirm directory
    if os.path.exists(dir_path):
        print("directory : " + dir_path, "exist")
    # confirm file
    file_name = "proton.root"
    if os.path.exists(dir_path + file_name):
        print("file : " + file_name, "exist")

    # make temporary folder
    tmp_dir_path = "_tmp\\"
    if os.path.exists(tmp_dir_path):
        pass
    else:
        os.mkdir(tmp_dir_path)

    # convert root file to csv file
    ex = subprocess.check_output(["root", "-l", "-q",
                                  'testConversion.C("{}", "{}")'.format(dir_path, file_name)])
    # confirm success or fail
    if ex is not None:
        print("output temporary csv file to", tmp_dir_path)
    else:
        print("cant' read root file")
        sys.exit()

    # list of temporary file
    tmp_file_list = os.listdir(tmp_dir_path)
    tmp_file_list = [tmp_file for tmp_file in tmp_file_list if '.csv' in tmp_file]
    tmp_file_name_list = [os.path.splitext(x)[0] for x in tmp_file_list if '.csv' in x]

    num_of_file = len(tmp_file_list)
    print("this is the list of histgrams")
    print(tmp_file_list)

    data_list = []
    data_info = []
    x_unit = []
    x_label = []
    y_label = []
    reg = r'\[.*?\]'

    for tmp_file in tmp_file_list:
        with open(tmp_dir_path + tmp_file, 'r') as f:
            reader = csv.reader(f)
            tmp_info = next(reader)
            list_match = re.findall(reg, tmp_info[0])
            x_unit.append(list_match[0])
            y_label.append(tmp_info[1])

            tmp_data = list(reader)
            tmp_data = np.array(tmp_data, dtype=np.float)
            data_list.append(tmp_data)
    print(x_label)
    print(x_unit)
    print(y_label)
    # row of figures
    row = int(np.sqrt(num_of_file))
    # column of figures
    col = num_of_file - row
    print(row, col)
    index = 0
    entries = []
    print(len(data_list))

    fig, axes = plt.subplots(row, col, figsize=(16, 9), dpi=100)
    for i in range(row):
        for j in range(col):
            if index >= len(data_list):
                break
            axes[i, j].step(data_list[index][:, 0], data_list[index][:, 1], color="black")
            axes[i, j].grid(True)
            axes[i, j].set_title(tmp_file_name_list[index])
            axes[i, j].set_ylabel("Count")
            axes[i, j].set_xlabel("Energy")
            entries.append(sum(data_list[index][:, 1]))
            index += 1

    print("Entries :", entries)
    plt.tight_layout()
    plt.show()


