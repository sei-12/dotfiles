#!/usr/bin/python3
import subprocess
import json


def fetch_iterm_window_data():
    query = subprocess.run(f"yabai -m query --windows",shell=True,stdout=subprocess.PIPE).stdout.decode()
    parsed = json.loads(query)
    window_data = list(filter(lambda x: x["app"] == "iTerm2",parsed))
    
    if len(window_data) == 0:
        return None

    return window_data[0]

def get_cur_space_id():
    query = subprocess.run(f"yabai -m query --spaces",shell=True,stdout=subprocess.PIPE).stdout.decode()
    parsed = json.loads(query)
    has_focus_list = list(map(lambda x: x["has-focus"],parsed))

    focus_index = has_focus_list.index(True)

    return parsed[focus_index]["index"]

def get_any_window_id():
    query = subprocess.run(f"yabai -m query --windows --space",shell=True,stdout=subprocess.PIPE).stdout.decode()
    parsed = json.loads(query)
    windows = list(filter(lambda x: not x["is-hidden"], parsed))
    if len(windows) == 0:
        return None
    return windows[0]["id"]


iterm_data = fetch_iterm_window_data()
cur_space_id = get_cur_space_id()

window_id = iterm_data["id"]

if cur_space_id != iterm_data["space"]:
    subprocess.run(f"yabai -m window {window_id} --space {cur_space_id}",shell=True,stdout=subprocess.PIPE)

if iterm_data["has-focus"]:
    subprocess.run(f"yabai -m window {window_id} --space 1",shell=True,stdout=subprocess.PIPE)
    any_id = get_any_window_id()
    if any_id != None:
        subprocess.run(f"yabai -m window --focus {any_id}",shell=True,stdout=subprocess.PIPE)

else:
    subprocess.run(f"yabai -m window --focus {window_id}",shell=True,stdout=subprocess.PIPE)
