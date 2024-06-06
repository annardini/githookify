# this list
default:
  @just --list --unsorted

# build and install gem
install:
  bundle exec rake install

# push the gem to rubygems.org
release:
  bundle exec rake release
