# YUI-rails

Easy integration of YUI with the asset pipeline in Rails 3.1 and greater.

## Usage

This gem vendors the latest YUI 3 for easy use.

Start with the installation instructions below.

By default the YUI base file will be added to your asset pipeline so you can use it immediately. Other files can be added as needed.

## Requirements

As long as you are using Rails 3.1 or greater you should be good.

## Installation while setting up a new Rails project

You can use the --javascript flag with rails to specify your preferred library when creating a new rails project. For example:

    rails foo --javascript=yui
    
This will create a new project named 'foo' with yui-rails already installed.

In your `app/assets/javascripts/application.js` there may also be a line that looks like:

    //= require jquery_ujs

If so, remove it.

## Installation after the fact

Add the library to your gemfile

    gem 'yui-rails'
    
Update your gem bundle

    bundle install
    
Make sure the following line is in your 'app/assets/javascripts/application.js':

    //= require yui
    
Remove any lines that reference jquery as applicable.

## Notes

I'm still in the process of deciding exactly how much of the YUI library to vendor, this will likely be evolving in early releases.

## Credits

Inspired by the [jquery-rails](https://github.com/rails/jquery-rails) gem by Steve Schwartz.

## License

Released under the MIT license.

Copyright (c) 2011 Matt Sanders

