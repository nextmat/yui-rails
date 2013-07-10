# YUI-rails

No-hassle integration of YUI with the Rails asset pipeline.

## Usage

This gem vendors the latest YUI 3 for easy use. Once installed, add YUI to your app by adding:

    //= require yui

To your `app/assets/javascripts/application.js`.

You can use debug or pre-minimized versions by instead requiring `yui-debug` or `yui-min`.


## Requirements

Rails 3.1 or greater.

## Installation

### Existing Rails project

Add the gem to your `Gemfile`:

    gem 'yui-rails'

Update your gem bundle:

    $ bundle install

### New Rails project

You can use the `--javascript` flag with rails to specify your preferred library when creating a new rails project. For example:

    rails new foo --javascript=yui

This will create a new project named 'foo' with yui-rails already installed.

## TODO

Plans for improvement in no particular order:

  * Decide how much (all?) of YUI to vendor (with debug versions everything is ~15.5mb, seems awfully heavy)
  * Provide intelligent loader to mimic CDN's ability to load a group of dependencies on demand as a single file

## Development

* Update the YUI library version with `./update-yui.sh 3.8.1` where 3.8.1 is the YUI version to update to.  Commit the changes, and then `rake install`. You should also change the gem version in yui/rails/version.rb
* Run tests with `rake`

## Credits

Inspired by the [jquery-rails](https://github.com/rails/jquery-rails) gem by Steve Schwartz.

## License

Copyright (c) 2011-2013 Matt Sanders. Released under the MIT license.
