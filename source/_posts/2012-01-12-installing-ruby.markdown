---
layout: post
title: "Installing Ruby"
date: 2012-09-12 00:15
comments: true
categories: 
problem: "How do we install Ruby and run Ruby programs?"
solution: "With Google, StackOverflow, and a little patience."
---



*This will likely be the most painful, least fun part of the lesson. If you are planning to take the ONA class, I strongly suggest you get this squared away. I will try to finish this chapter as quickly as possible. In the meantime, [Googling plain-language questions about Ruby installation](will get you pretty far.)*

*I wrote a detailed, but now [slightly-outdated primer on installation](http://ruby.bastardsbook.com/chapters/installation/) for the BBoRuby*



## The Ruby version

For the purposes of this tutorial, Ruby 1.8.7+ or Ruby 1.9.x (i.e. 1.9.2+ or 1.9.3) should work fine. Ruby 1.9.x is the preferred version

Some versions of Mac OS X have Ruby installed already. If you have 1.8.6, that *might* work but no guarantees.

For Windows, the RubyInstaller website may make installing Ruby [as simple as downloading a file](http://rubyinstaller.org/downloads/).



(TODO: some more basic instructions for installing Ruby.)


Once you have Ruby installed, you should be able to go to your **command line** and **Enter** in:

`ruby -v`

Which should print out the version of your system's Ruby.



## Rubygems

"Gems" are the name for Ruby code libraries. Installing them can give us access to some amazing functionality.

For this lesson, we will want these gems:

* [HTTParty](https://github.com/jnunemaker/httparty)
* [FasterCSV](http://fastercsv.rubyforge.org/) (unless you are using Ruby version 1.9.x)
* [json](http://flori.github.com/json/)

Before we can install these gems, we need to install RubyGems, which may also not be fun. 

* If you're on Windows and used [RubyInstaller](http://rubyinstaller.org/downloads/), then RubyGems may already be installed.

Otherwise, Google "[your operating system] + installing rubygems"

### Installing gems

RubyGems provides a command-line utility for installing the Ruby packages known as "gems"

So go to your command line and run the following commands to install the previously-mentioned gems:

* `gem install httparty`
* `gem install fastercsv` (only if you aren't on Ruby 1.9.x)
* `gem install json` (probably don't have to do this either on Ruby 1.9.x)








## For Mac users

Good news. If you're using Mac OS X from 10.5 (Leopard) on, Ruby is pre-installed on your computer.

If you want to get advanced, you can follow the [excellent instructions here](http://www.moncefbelyamani.com/how-to-install-xcode-homebrew-git-rvm-ruby-on-mac/). It's actually a lot of copy-and-pasting and downloading dependencies and following the steps.



## The test script

Are you ready to go? Try running the following script:

{% include_code A script to test your Ruby installation lang:ruby test-script.rb %}

Did it run without error? Congratulations. Else, please contact me at [dan@danwin.com](mailto:&#x64;&#x61;&#x6E;&#x40;&#x64;&#x61;&#x6E;&#x77;&#x69;&#x6E;&#x2E;&#x63;&#x6F;&#x6D;) or on Twitter via [@dancow](http://www.twitter.com/dancow)




## How to run a Ruby program

(todo)

### Interactive Ruby

How to run **irb**
(todo)

(see chapter in my [Ruby book for now](http://ruby.bastardsbook.com/chapters/installation/#h-2-5))

### "Hello World"

(todo)



### Running programs in the text-editor

(todo)