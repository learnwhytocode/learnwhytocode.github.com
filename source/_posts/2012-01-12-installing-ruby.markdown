---
layout: post
title: "Installing Ruby"
date: 2012-09-20 01:12
comments: true
categories: 
problem: "How do we install Ruby and run Ruby programs?"
solution: "With Google, StackOverflow, and a little patience."
---



Depending on your system, the installation process might go very quickly. Or this might be the most annoying lesson. If you are planning to take the ONA class, I strongly suggest you get this squared away. I will try to finish this chapter as quickly as possible. In the meantime, [Googling plain-language questions about Ruby installation](http://www.google.com/search?q=installing+ruby+on+windows)


If you have trouble running the script at the end of this lesson, and Google please contact me at [dan@danwin.com](mailto:&#x64;&#x61;&#x6E;&#x40;&#x64;&#x61;&#x6E;&#x77;&#x69;&#x6E;&#x2E;&#x63;&#x6F;&#x6D;) or on Twitter via [@dancow](http://www.twitter.com/dancow)


## Installing Ruby

For the purposes of this tutorial, Ruby 1.8.7+ or Ruby 1.9.x (i.e. 1.9.2+ or 1.9.3) should work fine. Ruby 1.9.x is the preferred version

Some versions of Mac OS X have Ruby installed already. If you have 1.8.6, that *might* work but no guarantees.

For Windows, the RubyInstaller website may make installing Ruby [as simple as downloading a file](http://rubyinstaller.org/downloads/).



#### For Mac users

Good news. If you're using Mac OS X from 10.5 (Leopard) on, Ruby is pre-installed on your computer.

If you want to get a little more advanced, you can follow the [excellent instructions here](http://www.moncefbelyamani.com/how-to-install-xcode-homebrew-git-rvm-ruby-on-mac/). It's actually a lot of copy-and-pasting and downloading dependencies and just carefully following the steps.




#### Testing out Ruby

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
* `gem install json` (probably don't have to do this on Ruby 1.9.x either)




## How to run a Ruby program

Go back to your **command line** window, where you previously had run the `gem install` commands.

This is how you run a Ruby program. 
1. Writing code into a **text file**
2. Saving that text file (using the *.rb* extension is preferred)
3. At the command line, *navigate* to the directory where you saved your program
4. At the command line prompt, type: `ruby thenameofyourfile.rb` and hit **Enter**

Try this now. You can use the **helloworld.rb** file saved into your working directory (if you finished the previous chapter).



### Interactive Ruby

For large, complex programs, you'll want to write them into text files and run them using the command-line `ruby` call, as above.

But for more immediate feedback and quick scripts, you might prefer **irb**, the **Interactive Ruby Shell**

**irb** is itself a program, which you run at the command line:

<div class="imgwrap">
	<img src="/images/lessons/terminals/irb-test.png">
</div>


**To exit irb**: type in `exit` and you will return to the command prompt.

### Keep track of irb and the command prompt
When looking at the **irb** program above, notice anything? Or, rather, *not* notice anything?

The command prompt in which you run system commands, including changing directories or running `irb` or `ruby`, looks nearly *exactly* the same as the **irb** console.

The prompt is different, but that's a detail that your eye might miss at first.

Here's a diagram of the Terminal window, as it enters and exits **irb**. The <span style="background: #fdd">red shaded area</span> represents the part where **irb** is running:

<div class="imgwrap">
	<img src="/images/lessons/terminals/irb-shell-color-numbered.png">
</div>

Here's the description of the numbered labels:

1. At the command prompt, I execute system commands: in this case, `ls`, to list directory files
2. Then I start **irb** by typing `irb` at the command prompt.
3. With **irb** started, I can execute Ruby commands.
4. I quit **irb** by typing `exit` and hitting **Enter**.
5. That kicks me back to the **command prompt**. I type another system command &ndash; `echo` &ndash; to confirm this.


#### "Hello World" in irb

Run **irb**. Let's repeat the "Hello world" script we tried previously.

At the **irb** prompt, type: 

`puts "Hello world"`

&ndash; and hit **Enter** (make sure you get the quote marks)

**irb** should immediately respond with feedback. If you get into a spot where hitting **Enter** is doing nothing, hit **Ctrl-C** a few times and hit **Enter** again.

``` plain
1.9.3p258 :005 > puts "Hello world"
Hello world
 => nil 
1.9.3p258 :006 > puts "I'm in irb!"
I'm in irb!
 => nil 
1.9.3p258 :007 > exit
dans-macbook-air:~ dairy$ 
```

### Running programs in the text-editor

**irb** is great for experimenting with Ruby, but can be cumbersome to run routines that span over more than a dozen lines. You'll eventually find it easier to create and edit in your text editor.

Depending on your text editor, you might be able to run your program *inside the text-editor* using a key-combination (e.g. **Ctrl-R** or **F5**) or menu command (e.g. **Run** or **Go**). 

This is little different than running your program from the command prompt. But it saves you the hassle of having to switch to the command prompt to type `ruby myscript.rb`.

This is what it looks like to run a program inside the Windows SciTE: 


<div class="imgwrap">
	<img src="/images/lessons/terminals/step-4-go.png">
</div>

<div class="imgwrap">
	<img src="/images/lessons/terminals/step-4-output.png">
</div>




## Testing out your system

Are you ready to go? Try running the following script:

{% include_code A script to test your Ruby installation lang:ruby test-script.rb %}

You can copy and paste it into a text file named **test-script.rb** in your **working directory**. And then run:

`rake test-script.rb`

Or, you could paste the entire thing into **irb**. Or run it directly from your text-editor. Whatever your preference.

Did it run without error? Congratulations. Else, please contact me at [dan@danwin.com](mailto:&#x64;&#x61;&#x6E;&#x40;&#x64;&#x61;&#x6E;&#x77;&#x69;&#x6E;&#x2E;&#x63;&#x6F;&#x6D;) or on Twitter via [@dancow](http://www.twitter.com/dancow)






