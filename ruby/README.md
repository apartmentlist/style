# Installation

### Gem

`gem install blue_steel`

### Manually

1. Add these gems to your `Gemfile`, most likely just in the `development`
   group:

  - [`blue_steel`][1]

2. Copy the minimal Rubocop configuration to your repository:

    ```
    cp style/ruby/sample.yml my_app/.rubocop.yml
    ```

    This file does little more than inherit from `global.yml`, which allows us
    to configure and change global style in a single place.

3. Add this pattern to your repo's `.gitignore`:

    ```
    /.rubocop-https*yml
    ```

    When Rubocop inherits from a URL, it downloads and caches the file locally
    so you don't have to hit the network every time. There's no need for that
    cache to be committed to the repository or clutter `git status`.

4. Install the Rake tasks (If you are not in a Rails app):

    In Rails applications `blue_steel` will automatically add its Rake tasks for
    you. Otherwise, install them manually:

    ```
    cp style/ruby/lib/tasks/style.rake my_app/lib/tasks/
    ```

    This provides you three Rake tasks:
    - `style:branch` - Runs style checks only on your diff from `master`
    - `style:all` - Runs all style checks
    - `style:count` - Prints counts of all style violations

5. Set your `Rakefile` default to include style checks:

    ```
    task default: %i[spec style:branch]
    ```

    Style checks will only run if specs passed, so you don't have to worry about
    pretty code until you have working code.

6. If you don't want CI to run style checks (perhaps because HoundCI does that
   on PRs), create a task to run without them:

   ```
   task ci: %i[spec]
   ```

   Presuming CI is handled by Travis, configure `.travis.yml` with

   ```yaml
   script: bundle exec rake ci
   ```

[1]: https://github.com/apartmentlist/style/tree/master/ruby/blue_steel
