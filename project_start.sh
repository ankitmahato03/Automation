#!/bin/bash

# Open backend in new terminal
gnome-terminal -- bash -c "cd ~/Desktop/backend && source venv/bin/activate && uvicorn main:app --reload; exec bash"

# Open frontend in new terminal
gnome-terminal -- bash -c "cd ~/Desktop/my_tool && npm run dev; exec bash"
