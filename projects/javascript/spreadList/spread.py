import sys

TIMELEFT=int(sys.argv[1])
items = ("make bed", "clean bathroom", "finish dishes", "sweep floors")

for i, item in enumerate(items):
    print("{}: {}".format(TIMELEFT/len(items) * (i+1), item))
