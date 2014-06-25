# Koombea Refactoring Workshop

Requirements: Ruby >1.9.3, git, `minitest` gem.

Each folder is named after the refactoring pattern they tackle, and contains:

* `app.rb` code we'll refactor.
* `setup.rb` necessary code for `app.rb` to run (just a basic framework)
  We don't need to see/edit it.
* `tests.rb` self explanatory. Necessary for refactoring.

You may run tests by running `tests.rb` or `app.rb` files, like:

```bash
$ ruby app.rb
Run options: --seed 53634

# Running:
..

Finished in 0.001191s, 1679.2611 runs/s, 3358.5223 assertions/s.

2 runs, 4 assertions, 0 failures, 0 errors, 0 skips
```

# Refactoring Patterns
1. Intention Revealing Method

2. Special Case Object

3. Replace Method with Method Object

This project is based on: https://github.com/tute/refactoring-workshop

So all the credits to him.
