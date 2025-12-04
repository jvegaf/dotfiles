#!/bin/user/env bash

fix_unlock() {
  numlock_file="/etc/default/numlockx"
  sudo rm $numlock_file
  echo "NUMLOCK=off" | sudo tee -a $numlock_file
}
