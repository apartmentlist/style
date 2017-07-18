# frozen_string_literal: true

require 'rubocop/git/cli'

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
    puts %x(
      rubocop --display-cop-names |
      grep -oE '[CW]: [^:]+'      | # Extract "C: Thing/YouBroke"
      sort                        |
      uniq -c                     |
      sort -rn
    )
  end
end
