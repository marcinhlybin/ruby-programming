# Chapter 29: Package your programs as gems

## gems

```
gem list -a --remote ruby-mp3info
```

Multiple versions can be installed:

```
gem install --version 0.5 ruby-mp3info
gem install --version 0.5.1 ruby-mp3info
gem install --version 0.6 ruby-mp3info
```

```
gem 'ruby-mp3info', '=0.5'
require 'mp3info'
```

## hoe

Hoe gem for building gems automatically.


Prepare directory structure:

```
sow Document
```
