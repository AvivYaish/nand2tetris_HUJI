# Script by Segal and Kali
# Version 2.0

"""                           ----- USAGE -----
 Please make sure that you have both 'bitstring' and 'pyperclip' libraries.
 If you don't, use 'pip install xxx' to install them.
"""


import sys
import os
import numpy as np
import pyperclip
from PIL import Image
from bitstring import Bits

# Below is black, above is white
MID_COL = 180
WORD_SIZE = 16
ROW_OFFSET = 32
BAD_VALUE = -32768
GOOD_VALUE = 16384
B1       = '    function void drawNAME(int offset) {'
B2       = '        var int scnAddres;'
B3       = '        let scnAddres = 16384 + offset;'
LINE_PRE = '        do Memory.poke(scnAddres + '
A1       = '        return;'
A2       = '    }'


def average(cell):
    sum = 0
    for val in cell:
        sum += val
    return sum / len(cell)


def img_to_bool(path):
    # Final boolean 2d-array
    bw = []

    # Open image an validate size
    img = Image.open(path)
    width, _ = img.size
    if not width % WORD_SIZE == 0:
        raise Exception('Given image width does not divide by 16!')
    col_num = int(width / WORD_SIZE)

    # Convert to binary
    p = np.array(img)
    for row in p:
        bool_row = []
        for cell in row:
            avg = average(cell)
            value = '1' if avg < MID_COL else '0'
            bool_row.append(value)
        bw.append(bool_row)
    return bw, col_num


def word_to_int(word):
    word = reversed(word)
    word = ''.join(word)
    as_int = Bits(bin=word).int
    if as_int == BAD_VALUE:
        as_int = GOOD_VALUE
    return as_int


def as_line(offset, value):
    return LINE_PRE + str(offset) + ', ' + str(value) + ');'


def bool_to_jack(bw, col_num, name):
    b1 = B1.replace("NAME", name)
    result = [b1, B2, B3]
    for i, row in enumerate(bw):
        for j in range(col_num):
            word = row[0:WORD_SIZE]
            row = row[WORD_SIZE:]
            value = word_to_int(word)
            offset = i * ROW_OFFSET + j
            line = as_line(offset, value)
            result.append(line)
    result += [A1, A2]
    result = '\n'.join(result)
    return result

def getName(path):
    base = os.path.basename(path)
    name = os.path.splitext(base)[0]
    name = name.capitalize()
    return name

def main(path):
    print("Converting image to binary values...")
    bw, col_num = img_to_bool(path)
    name = getName(path)
    print("Converting matrix to jack lines...")
    result = bool_to_jack(bw, col_num, name)
    pyperclip.copy(result)
    print("Success! Result copied to clipboard.")

if __name__ == "__main__":
    print("\n  --- Image to Jack converter --- \n")
    if len(sys.argv) != 2:
        print("Fatal: No path was given.")
        print("Usage: python jackify.py <path-to-image>")
    else:
        path = sys.argv[1]
        main(path)