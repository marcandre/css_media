# CssMedia

[![Gem Version](https://badge.fury.io/rb/css-media.svg)](https://badge.fury.io/rb/inky-rb) [![Build Status](https://travis-ci.org/zurb/ss-media.svg?branch=master)](https://travis-ci.org/zurb/inky-rb)

A small rails extension to segregate `@media` CSS rules.

This can be helpful when sending emails, as non media rules should be inlined (with [`premailer-rails`](https://github.com/fphilipe/premailer-rails) or [`roadie`](https://github.com/Mange/roadie)) but media rules should be included with a `<style>` tag.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'css_media'
```

And then execute:

    $ bundle

## Usage

If your filename contains `media-only`, then only the `@media` css rules will be kept. If the filename matches `non-media` or `no-media`, then all rules will be kept except the `@media` rules. Other assets will be kept intact

## Development

Much of the boilerplate code copied from [`autoprefixer-rails`](https://github.com/ai/autoprefixer-rails), thanks!

To run the tests: `rspec`. You'll need to initial run `bundle` of course.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

