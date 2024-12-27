#!/bin/bash

# Function to stop all running Docker containers
stop_containers() {
  echo "Stopping all running Docker containers..."
  docker ps -q | xargs -r docker stop
}

# Function to remove all stopped Docker containers
remove_containers() {
  echo "Removing all stopped Docker containers..."
  docker ps -a -q | xargs -r docker rm
}

# Function to forcefully kill all running Docker containers
kill_containers() {
  echo "Killing all running Docker containers..."
  docker ps -q | xargs -r docker kill
}

# Function to show usage instructions
show_usage() {
  echo "Usage: $0 {stop|remove|kill|all}"
  echo "  stop   - Stop all running containers"
  echo "  remove - Remove all stopped containers"
  echo "  kill   - Forcefully kill all running containers"
  echo "  all    - Stop and remove all containers"
}

# Main script execution
if [ $# -eq 0 ]; then
  show_usage
  exit 1
fi

case $1 in
  stop)
    stop_containers
    ;;
  remove)
    remove_containers
    ;;
  kill)
    kill_containers
    ;;
  all)
    stop_containers
    remove_containers
    ;;
  *)
    show_usage
    exit 1
    ;;
esac

echo "Operation completed."
