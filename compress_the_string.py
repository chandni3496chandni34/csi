from itertools import groupby


for number, lst in groupby(input()):
    print(f"({len(list(lst))}, {number})", end=" ")
