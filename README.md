# Coding In Style

We all recognize that style matters, and particularly that having _a_ consistent
style matters more than _my_ or _your_ particular preference for a style (See
Sandi Metz's _Looks Matter_). This repository contains the Apartment List style.

# Installation

## Ruby

1. Add these gems to your `Gemfile`, most likely just in the `development`
   group:

    - [`rubocop`](https://github.com/bbatsov/rubocop) - The base rules, more or
      less agreed upon by the Ruby community.
    - [`rubocop-rspec`](https://github.com/backus/rubocop-rspec) - More
      customized rules for the `spec/` directory, where RSpec's DSL is more
      valuable than "normal" Ruby style.
    - [`rubocop-git`](https://github.com/m4i/rubocop-git) - This lets you run
      style checks on just your changes, so you're not responsible for a whole
      history of accumulated style mishaps.

2. Copy the minimal Rubocop configuration to your repository:

    ```
    cp style/.rubocop-sampl.yml my_app/.rubocop.yml
    ```

    This file does little more than inherit from `.rubocop-global.yml`, which
    allows us to configure and change global style in a single place.

3. Add this pattern to your repo's `.gitignore`:

    ```
    .rubocop-http*yml
    ```

    When Rubocop inherits from a URL, it downloads and caches the file locally
    so you don't have to hit the network every time. There's no need for that
    cache to be committed to the repository or clutter `git status`.

4. Install the Rake tasks:

    ```
    cp style/lib/tasks/style.rake my_app/lib/tasks/
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

# Changing Style

Thrash is anathema to consistency, so we are making it very difficult to change
styles. Consider it a Constitution. We all agreed on it hundreds of years ago,
and though everyone has some gripes with it, it's pretty good and we're leaving
it alone.

Since we're intentionally making it difficult to change, I'm only going to give
you one criterion to consider when you want to propose a change:

1. The style is probably not going to change
