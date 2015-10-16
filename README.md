# RUBYCONF.CO 2015
# Ruby Refactoring Workshop

Requirements: Ruby >1.9.3, git, `minitest` gem.

Once you clone the repo, run:

`bundle install`

Each folder is named after the refactoring pattern they tackle, and contains:

* `app.rb` code we'll refactor.
* `setup.rb` necessary code for `app.rb` to run (just a basic framework)
  We don't need to see/edit it.
* `tests.rb` self explanatory. Necessary for refactoring.

You may run tests by running `app.rb` file,  so for the first example:

```bash
$ ruby 1-intention-revealing-method/app.rb
Run options: --seed 16319

# Running:

....

Finished in 0.001447s, 2765.0585 runs/s, 3456.3231 assertions/s.

4 runs, 5 assertions, 0 failures, 0 errors, 0 skips
```

# Refactoring Patterns
1. Intention Revealing Method

2. Special Case Object

3. Replace Method with Method Object

This workshop is based on: https://github.com/tute/refactoring-workshop

So all the credits goes to him.
