#!/bin/bash

# kill sublime for a safe edit of the session
killall sublime_text

# cd to sublime root dir
cd ~/.config/sublime-text-3/

# remove project files
rm Projects/$1.sublime-project Projects/$1.sublime-workspace

# remove project from recent workspaces in the session
tmp=$(mktemp)
jq "del(.workspaces.recent_workspaces[] | select(contains(\"$1.sublime-workspace\")))" Local/Session.sublime_session > $tmp
mv $tmp Local/Session.sublime_session
