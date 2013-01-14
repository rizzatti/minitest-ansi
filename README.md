# MiniTest::ANSI [![Build Status][build-status]][travis]

Colorize your minitest output using ANSI colors.

![Screenshot][screenshot]

## Installation

Add this line to your application's Gemfile:

```ruby
group :development do
  gem 'minitest-ansi'
end
```

And then execute:

```bash
$ bundle
```

Or install it yourself as:

```bash
$ gem install minitest-ansi
```

## Usage

You probably want to add this to your `test_helper.rb` (or equivalent).

```ruby
require 'minitest/ansi'

MiniTest::ANSI.use!
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

[build-status]: https://travis-ci.org/zehrizzatti/minitest-ansi.png "Build status"
[screenshot]: https://github.com/zehrizzatti/minitest-ansi/raw/master/images/screenshot.png "Minitest::Ansi"
[travis]: https://travis-ci.org/zehrizzatti/minitest-ansi "Travis CI"
