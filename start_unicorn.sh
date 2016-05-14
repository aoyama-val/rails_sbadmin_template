#!/bin/bash

bundle exec unicorn_rails -c $(pwd)/config/unicorn.rb -E production -D
