---
layout: post
title: "Writing our own methods"
date: 2012-09-12 03:05
comments: true
categories: 
problem: "Typing out the same steps to download and save files is becoming repetitive."
solution: "Let's write our own method to wrap these steps in a single call."
---

Naming files can be a real pain.

If you're dealing with one file, it's easy to just use some arbitrary name, like `myfile.txt`.

But if you're downloading thousands of files, you're going to need a more robust naming system. Rather than think up names for each file, why not just give them the same name as their web address?

For example, for the data file at: `http://TK_DATA_ROOT_PATH/users/TKBohner/show.json`

Why don't we save it as is? That way, when we look at the file, we know exactly where we got it from. 

Not a bad idea. But it's not quite that easy. If you've plumbed around your file system, you know you can't use just *any* character for the filename. You can't use the `/` character, because that is often used to denote directory structure.

Luckily, there's another library, named [CGI](http://www.ruby-doc.org/stdlib-1.9.3/libdoc/cgi/rdoc/CGI.html "Class: CGI (Ruby 1.9.3)"), that can do this substitution for us. It's called, `CGI.escape`:

```
TKirb
require 'cgi'
url = "TK"
fname = CGI.escape(url)
```

The result of `escape` looks like gibberish, right? That's because the `escape` method converts all the unsafe characters to strings that are appropriate for file systems. Think of it as "escaping" from the unwanted effects of these unsafe characters. The `"/"` character, for example, is converted to `"%2F"`.

What's the use of a filename that is gibberish to humans? Well, we have the option of *un*-escaping these "safe" strings:

```
CGI.unescape(fname)

```


## Wrap up the steps

Let's review what we've covered so far. In order to download from a URL and save a file to disk, we have to:

1. Use `HTTParty.get` on a given URL
2. Create a new file with an escaped version of the URL
3. Write the contents of the `body` of the response to `HTTParty.get` into this new file
4. Close the file.

Here's the code to do that:

``` ruby
require 'rubygems'
require 'cgi'
require 'httparty'

url = "TK"
resp = HTTParty.get(url)

filename = CGI.escape(url)
fstream = File.open(filename, 'w')
fstream.write(resp.body)
fstream.close

```

Not counting the `require` statements, that's a lot of code. So let's write our own method to encapsulate those steps. Think of it as a shortcut.


## Method definitions

Here's the basic structure of a method:

``` ruby

def the_method_name(argument1, argument2, argumentetc)
	# do some work here, such as:	
	answer = argument1 + argument2 + argumentetc

	return some_value
end
```

The number of arguments is up to us; we can have one, two, ten, or no arguments passed into the method. And the same goes for the *names* of the arguments. Their names only have meaning within the body of the method definition (i.e. everything in between the `def` and `end`). (This is easier to demonstrate than to explain.)

The other thing to note for now is that the `return` keyword designates the value that is returned once the method is done. In Ruby, if `return` isn't used, the method automatically returns what was in the last line.

Let's write a simple method to print `"Hello world"`

``` ruby

def hello_world
	puts "Hello world"
end

```

The above method has no arguments since it needs none. And it doesn't really return a value since it just prints to screen.

Here's a variation of this method to print `"Hello"` to something of our choice.

``` ruby
def hello(some_target)
	puts "Hello " + some_target.to_s
end
```

Again, this method prints to screen but nothing is returned. Try the method out in **irb**:

``` ruby
# parentheses are optional, but it helps for readability

1.9.3-head :006 > hello("world")
Hello world
 => nil 
1.9.3-head :007 > hello(42)
Hello 42
 => nil 
1.9.3-head :008 > hello()
ArgumentError: wrong number of arguments (0 for 1)
	from (irb):8:in `hello'
	from (irb):8
```

What caused that last error? When we defined `hello` to take a single argument, the Ruby interpreter mandates that the user passes in exactly one (not zero, or two, or ten) argument. Hence, the `wrong number of arguments` message.

### A return value

As I pointed out, the `hello_world` and `hello` methods do not **return** a value. This is because the only line in their definition is a call to `puts`, which is itself a method that returns nothing &ndash; or, as Ruby calls it, `nil` (try finding out what the `class` of `nil` is).

So let's redefine `hello` to return an actual string:

``` ruby
def hello(some_target)
	return "Hello " + some_target.to_s
end
``` 

As I said earlier, if you don't specifically use `return`, Ruby just returns whatever was in the last line:

``` ruby
def hello(some_target)
	"Hello " + some_target.to_s
end
``` 

Why would you want to return a string, instead of just putting to screen? Maybe you want to do something else to that string besides echo it to screen. Maybe you want to write the result of `hello` to a file. Or maybe you want to transform the result in another way:

``` ruby
def hello(str)
	"Hello " + str.to_s
end
```

Usage in irb:

``` ruby
1.9.3-head :014 > def hello(str)
1.9.3-head :015?>   "Hello " + str.to_s
1.9.3-head :016?>   end
 => nil 
1.9.3-head :017 > val = hello("terra")
 => "Hello terra" 
1.9.3-head :028 > puts val
Hello terra
 => nil

# define a new method for fun

1.9.3-head :019 > def embiggen(str)
1.9.3-head :020?>   str.to_s.upcase + "!!!"
1.9.3-head :021?>   end
 => nil 
1.9.3-head :022 > embiggen(hello("earth"))
 => "HELLO EARTH!!!" 

```

### Scope

You might have noticed something peculiar in that method definition for `embiggen`: it called its argument `str`, which is what the `hello` method we defined calls *its* single argument.

How is this not a problem?

As I mentioned earlier, the names of arguments only have **scope** within their method definitions. This is actually a somewhat nuanced concept that you'll have to study later. It's enough to think of method definitions as their own little world for now. Our methods that we'll write for this tutorial will be simple enough to avoid investigating further.

But for now, consider this:

``` ruby
1.9.3-head :024 > def hello_method(my_special_string)
1.9.3-head :025?>   return my_special_string.to_s.upcase + "! :)"
1.9.3-head :026?>   end
 => nil   # (hello_method has been defined)

1.9.3-head :027 > hello_method("Ponies")
 => "PONIES! :)" 
1.9.3-head :028 > puts my_special_string
NameError: undefined local variable or method `my_special_string' for #<Object:0x100c1e2a0>
	from (irb):28
```

The Ruby interpreter, once we've finished defining `hello_method`, has absolutely no recognizance of the `my_special_string` variable. That `my_special_string` label lives only within the definition of `hello_method`


## Writing our own methods

That is enough theory for now. Let's get back to solving our problem: writing a method that downloads from a URL and saves to a file with an escaped filename.

Your first instinct may be to write a method that does all of the above at once. In fact, it's better to break it down to several methods.

### The `download_from_url` method

Let's start off easy. Define the `download_from_url` method which:
1. Takes in exactly one argument (what do you think that is?)
2. Downloads something given the passed-in argument
3. Returns the contents of the download

Here's one way to do it:

``` ruby
def download_from_url(the_url)
	resp = HTTParty.get(the_url)
	return resp.body
end
```

Your first reaction may be: what was the point of that? Admittedly, we didn't add much to the HTTParty functionality. It's almost as if the method we wrote were just a *wrapper* of sorts.

And that's fine. We *want* `download_from_url` to be that simple. It's main purpose is to *obscure* to the user *how* something is downloaded so that all the user needs to care about is how to actually invoke the method:

```
1.9.3-head :036 > newyorktimespage = download_from_url("http://www.nytimes.com")
1.9.3-head :037 > puts newyorktimespage.length
169751
```

If you've just started programming, then you don't realize how in the lifecycle of a program the interdependency of code and how *details* can change.

Consider some program that *you* did not write, but that includes your `download_from_url` method.

What if the underpinnings of the Internet change and HTTParty's author doesn't update the library? Then every program that uses your `download_from_url` method is in trouble.

*But*, you can *adapt* by redefining `download_from_url` to use a better downloading-library. And furthermore, you don't have to worry about finding all the other programs that use `download_from_url`. As long as whatever new library you're using acts the same as `HTTParty.get`.


### The url_to_local_filename method

This is another wrapper method. Maybe in the future, we'll have a different file naming scheme in which `CGI.escape` is not enough to to convert the unsafe characters. So we'll wrap up the details of the conversion, even though it consists only of using `CGI.escape` (for now), in `url_to_local_filename`.

The requirements:
1. Take in one argument
2. Returns an escaped string 

This should be simpler to define than the `download_from_url` method

``` ruby
def url_to_local_filename(url)
	CGI.escape(url)
end
```

While we're at it, define the method that reverses the conversion:

``` ruby
def local_filename_to_url(fname)
	CGI.unescape(fname)
end
```


### The my_file_writer method

*Note: if you know anything about Ruby blocks, then you know file-access doesn't have to involve 3 lines of code. But we're not covering blocks and closures just yet*

File writing seems more complicated than it should, doesn't it? Three steps to just write some content to a file and save it?

``` ruby
fstream = File.open("somefilename.txt", 'w')
fstream.write("a bunch of content")
fstream.close
```

Wrap up these steps in a method called `my_file_writer`. It doesn't really need to return anything, but think carefully about how many arguments it should accept.

``` ruby
def my_file_writer(filename, content)
	fstream = File.open("somefilename.txt", "w")
	fstrem.write(content)
	fstream.close
end
```


##### Exercise

We've written so much code and learned so much theory that we might have forgotten the whole point of this tutorial: a single method to *download from a URL and save to a file*.

So, *assuming the methods we just defined are in memory*, write a `download_and_save` method.

##### Answer

``` ruby
def download_and_save(url)
	content = download_from_url(url)
	filename = url_to_local_filename(url)
	my_file_writer(filename)
	
	return content
end
```

Methods within methods, like a set of those Russian porcelain dolls. Does `download_and_save` have to return the downloaded `content`? Not necessarily, but maybe a program that uses `download_and_save` may still want to work with the content after it's saved to disk.


