---
layout: post
title: "Terminals and Text Editors"
date: 2012-09-12 01:10
comments: true
categories: 
problem: "What do we use to write code?"
solution: "We'll learn how to access our systems' command line and install one of the free and excellent text editors ideal for writing code."
---

This lesson is intended for beginners, so I can't assume that you know the common operating system features that programmers take for granted. This is a startup guide to get you acquainted with what's beneath the surface of your point-and-click computing.

*As this section is currently a skeleton, refer to the detailed guide I wrote for the [Bastards Book of Ruby](http://ruby.bastardsbook.com/chapters/installation/). At the very least, download one of the recommended free text editors: [TextWrangler for Mac OS X](http://www.barebones.com/products/TextWrangler/) and [Notepad++ for Windows](http://notepad-plus-plus.org/).*


## Navigating your file system

This tutorial doesn't require that you be an expert at computers (...*yet*). But you do need some basic familiarity with your operating system.

Whatever your operating system, please make sure you know how to do this:

1. Find either your `Desktop` or `Downloads` folder. Or you could go straight to your "C:\" drive
2. In either of these folders, view the contained files as a **list**.
3. Sort the list of files by name.
4. Now **create a new folder** inside the current folder and name it `learn_why`

This `learn_why` subfolder will be the working directory for your work in this tutorial. Make sure you remember what its parent folder is &ndash; either `Desktop` or `Downloads`...or whatever you picked.

From here on out, I will be referring to it as the **working directory**. 


## Install a text editor

The code for our programs is simply **text**.

But Microsoft Word nor iWork will be ideal for this. We want a text editor that was designed for coding.

For **Windows**, there is [Notepad++](http://notepad-plus-plus.org/ "Notepad++ Home") or [SciTE](http://www.scintilla.org/SciTE.html "Scintilla and SciTE").

For Mac OS X, there is [TextWrangler](http://www.barebones.com/products/TextWrangler/ "Bare Bones Software | TextWrangler"). You can download it from its [homepage](http://www.barebones.com/products/TextWrangler/) or get it from the Mac App Store.

The advantage of a dedicated text-editor is that it can provide <span style="background:#FAF14E">highlighted syntax</span>. As you'll find out early, certain words and symbols in Ruby have special meaning in the language. Text-editors distinguish these characters from the non-special ones:


<div class="imgwrap"><img src="/images/lessons/terminals/hello-world-textwrangler.png"></div>

### Make a Ruby program

All we've done is install a text editor and we're already going to write our first Ruby program: that's progress!

1. Start a new text file
2. Type the following, *exactly*: `puts "Hello world"`
3. Save this file as "helloworld.rb" in your **working directory**

Using your operating systems file explorer, try to find the **helloworld.rb** file. It should be the sole file in your **working directory** for now.

All we did was write some Ruby code. It's a program, but it won't do anything until we **execute** it.

If your system already has Ruby installed, you might even be able to run it from your text editor. You can see some instructions I wrote for my [Ruby programming book](http://ruby.bastardsbook.com/chapters/installation/#text-editor-run). If you can't run the **helloworld.rb** program, no big deal for now.

## The command line
This is where you may be entering unfamiliar territory.

The **command line**, which I might sometimes refer to as the **terminal**, is the plain-text way of manipulating your operating system. You can do things such as change directories, rename files, or delete them. You just won't be using your mouse.

The steps to get there are different for each operating system.

### Windows users

1. Click on the Windows menubar button, and select the **Run...** option. Or hit **Ctrl-R**
2. Type `cmd`
3. A bland program window should open up
4. Type `dir` and hit **Enter**
5. A list of files should appear
6. Make a shortcut to the command prompt by creating a shortcut on your Desktop linking to cmd.exe

Your terminal window will kind of look like this:

<div class="imgwrap">
	<img src="/images/lessons/terminals/cmd.png">
</div>


### Mac users


1. In **Finder**, go to the **Applications » Utilities** folder
2. Open the **Terminal.app**
3. A bland program Window should open up.
4. Type `ls` and hit **Enter**
5. A list of files should appear
6. Make a shortcut to the command prompt by dragging the Terminal app to your dock.

Here's what the OS X terminal looks like:

<div class="imgwrap">
	<img src="/images/lessons/terminals/prompt-window-macosx.png">
</div>


#### Find your working directory

In Windows and in OS X, the command to "change directory" is `cd`

Example usage:

`cd ~/Desktop/learn_why`

`cd C:\learn_why`

Once you're in your working directory, use the appropriate command to list files. Do you see the "helloworld.rb" file?


#### Try ruby

This may or may not work for you. If you're still in your working directory, type in:

`ruby helloworld.rb`

If Ruby is properly installed, you should see something like this:

<div class="imgwrap">
	<img src="/images/lessons/terminals/learn-why-terminal.png">
</div>

If you ran into an error, it may be because Ruby isn't yet installed. We'll get to there in the next chapter.

 
## The web

There's no specific web browser requirement for this tutorial. Use whatever you feel comfortable with.

*The following might seem pedantic, but you can never be sure...*

The term URL refers to the address of some resource, such as a webpage or image, somewhere on the Internet.


#### URLs
So the URL for Google's webpage is `http://www.google.com`

This is also a URL:
`http://so.danwin.com/onacode/sunlight-foundation-congress-10.txt`


#### Manually visiting URLs
Copy-and-paste that URL into your browser's Address Bar and hit **Enter**.

You should see a jumble of text. This is because that URL pointed to a text file, not a fancy web page.

#### Saving pages to disk

Go to your web browser's **File** menu and select the **Save As...** or **Save Page As...**

In the file-saving dialog box, save the current page (i.e. this text file) into your **working directory**


OK, now open that text file, whatever you named it, with your text-editor.

And that's it. Just wanted to make sure you could easily navigate around your operating system. Now to the hard part: installing Ruby. Or the right version of it.





