# git-stats
Calculate word counts, excluding moved text, for a git repo.

# Included:

- `./count_changed_words.sh "<days_ago>"`
  - Count the number of words changed (added+deleted) in a git repo, e.g., for tracking a latex doc, excluding the text that was only moved.
  - `<days_ago>` is the argument to the `--since=...` argument of git rev-list. Make sure it's in quotes.
    - E.g., "5am", or, maybe, "10 days ago".
  - Outlined here: https://gist.github.com/MilesCranmer/5c7d86c8740219355d2dfdb184910711
  - Made to answer this: https://stackoverflow.com/a/44615229/2689923
