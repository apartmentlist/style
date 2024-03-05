#! /usr/bin/env bash -ex

##
# Run this script to add Rubocop to a project and apply all safe auto-corrections
##

# Make sure dependencies exist
for gem in rubocop rubocop-rspec rubocop-rails; do
  if [ "$(grep $gem Gemfile)" == '' ]; then
    bundle add $gem --group development
  fi
done

# Set up Rubocop config
if [ "$(grep .rubocop-http .gitignore)" == '' ]; then
  printf "\n# Rubocop cache files\n.rubocop-http*\n" >> .gitignore
fi
touch .rubocop_todo.yml
cat << EOF > .rubocop.yml
require:
  - rubocop-rspec
  - rubocop-rails

inherit_from:
  - https://raw.githubusercontent.com/apartmentlist/style/rubocop-2022/ruby/global.yml
  - .rubocop_todo.yml
EOF

# Auto-fix and generate TODO file
bundle exec rubocop -a --only Migration/DepartmentName
bundle exec rubocop --safe --auto-correct || true # This will exit with code 1 if anything isn't correctable
bundle exec rubocop --auto-gen-config --exclude-limit 100
bundle exec rubocop -P
