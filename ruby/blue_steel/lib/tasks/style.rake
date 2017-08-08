# frozen_string_literal: true

# No need to have Rubocop in production, so be careful loading it.
begin
  require 'rubocop/git/cli'
rescue LoadError
  puts <<-MSG
    Warning: RuboCop::Git is not available.
    Run `gem install rubocop-git` or add it to your Gemfile
  MSG
end

namespace :style do
  desc 'Run style checks for the entire repository'
  task all: :environment do
    system('rubocop --display-cop-names')
  end

  desc 'Run style checks on your diff from `master`'
  task branch: :environment do
    RuboCop::Git::CLI.new.run(%w[--display-cop-names master])
  end

  desc 'Print total violation counts'
  task count: :environment do
    puts `
      rubocop --display-cop-names |
      grep -oE '[CW]: [^:]+'      | # Extract "C: Thing/YouBroke"
      sort                        |
      uniq -c                     |
      sort -rn
    `
  end
end
