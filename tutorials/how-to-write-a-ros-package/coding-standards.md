---
description: How To Code.
---

# Coding Standards

## Google C++ Style

We use the [Google Style Guide](https://google.github.io/styleguide/cppguide.html) and indent with 2-wide spaces. 80-characters wide. Only exception is that we lead function names with a lower-case letter to distinguish from classes \(`thisIsMyFunction` in our style, vs `ThisIsMyFunction` in pure Google C++\).

## Autoformatting

Take some time to set up an autoformatter in your editor. Keep in mind that the eclipse autoformatter does not put brackets in the right place, but does most of the rest.

For extreme cases, use clang-format **AND BE VERY CAREFUL TO ONLY RUN THIS ON YOUR OWN PACAKGE**.  
 This will autoformat everything in the package:

```text
sudo apt-get install clang-format-3.4 
find -name "*.cpp" | xargs clang-format-3.4 -style=Google -i
find -name "*.h" | xargs clang-format-3.4 -style=Google -i
```



