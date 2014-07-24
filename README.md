# Ruby Quiz #2 Solution

A solution to the [second Ruby quiz](http://rubyquiz.com/quiz2.html).

This command line utility selects secret santas for a list of people.

The original quiz requested that the santas be emailed, but I just made a list.

```bash
gem install 'ruby_quiz_2'
```

`feasible.txt`
```
Luke Skywalker <luke@theforce.net>
Leia Skywalker <leia@therebellion.org>
Toula Portokalos <toula@manhunter.org>
Gus Portokalos <gus@weareallfruit.net>
Bruce Wayne <bruce@imbatman.com>
Virgil Brigman <virgil@rigworkersunion.org>
Lindsey Brigman <lindsey@iseealiens.net>
```

```bash
barelyknown$ ruby_quiz_2 secret_santas feasible.txt

SECRET SANTA SELECTIONS

Santa                     Giftee
------------------------- -------------------------
Luke Skywalker            Lindsey Brigman
Leia Skywalker            Gus Portokalos
Toula Portokalos          Bruce Wayne
Gus Portokalos            Leia Skywalker
Bruce Wayne               Virgil Brigman
Virgil Brigman            Toula Portokalos
Lindsey Brigman           Luke Skywalker
```
