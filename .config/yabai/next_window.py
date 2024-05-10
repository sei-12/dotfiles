#!/usr/bin/python3
import subprocess
import json
import argparse


def next_index(focus_index,houkou,length):
    if houkou == "next":
        n_i = focus_index + 1
    else:
        n_i = focus_index - 1
        
    if n_i >= length:
        n_i = 0
    if n_i <= -1:
        n_i = length - 1
    
    return n_i


parser = argparse.ArgumentParser()
parser.add_argument("houkou")
args = parser.parse_args()

query = subprocess.run(f"yabai -m query --windows --space",shell=True,stdout=subprocess.PIPE).stdout.decode()

parsed = json.loads(query)

parsed.sort(key=lambda x: x["frame"]["x"])

parsed = list(parsed)

has_focus_list = list(map(lambda x: x["has-focus"],parsed))

try:
    focus_index = has_focus_list.index(True)
except ValueError:
    focus_index = 0

next_index_ = next_index(
    focus_index,
    args.houkou,
    len(parsed)
)

subprocess.run(f"yabai -m window --focus {parsed[next_index_]['id']}",shell=True)