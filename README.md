# MiniTest::ANSI

Colorize your minitest output using ANSI colors.

[![Build Status][travis-badge]][travis-site]
[![Dependency Status][gemnasium-badge]][gemnasium-site]
[![Code Climate][cc-badge]][cc-site]

## How it looks

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

[cc-badge]: https://codeclimate.com/badge.png
[cc-site]: https://codeclimate.com/github/rizzatti/minitest-ansi
[gemnasium-badge]: https://gemnasium.com/rizzatti/minitest-ansi.png
[gemnasium-site]: https://gemnasium.com/rizzatti/minitest-ansi
[screenshot]: https://github.com/rizzatti/minitest-ansi/raw/master/images/screenshot.png
[travis-badge]: https://travis-ci.org/rizzatti/minitest-ansi.png
[travis-site]: https://travis-ci.org/rizzatti/minitest-ansi
