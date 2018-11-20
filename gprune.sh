#!/bin/bash
# Prunes all local branches that have been merged into master.

git branch --merged master | grep -v '^[ *]*master$' | xargs git branch -d
