#!/usr/bin/env bash

while true
do
  inotifywait -re modify ./init;
  make all;
  sleep 3;
  make logs;
done
