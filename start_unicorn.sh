#!/bin/bash

export RAILS_ENV=production
export RAILS_SERVE_STATIC_FILES=true

bundle exec rake assets:precompile
bundle exec unicorn_rails -c $(pwd)/config/unicorn.rb -E production -D
