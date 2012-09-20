---
layout: post
title: "Reading from a spreadsheet-like file"
date: 2012-09-12 03:20
comments: true
categories: 
problem: "How to read data from a spreadsheet-like file, such as CSV?"
solution: "Use the FasterCSV library and Hash objects to simplify reading the datafile."
section_header: "Advanced Projects"
---


## The CSV (or FasterCSV) library

(draft)

If you have Ruby 1.8, install the [FasterCSV gem.](http://fastercsv.rubyforge.org/)

If you have Ruby 1.9, FasterCSV is part of the CSV library, so you just need to have the `require` statement.

In our `my_code.rb` file, I've handled both conditions like so:

``` ruby
if RUBY_VERSION > "1.9"
  require 'csv'
else
  require 'fastercsv'
end
``` 


## CSV Files

(draft)

The [Sunlight Foundation](http://services.sunlightlabs.com/) maintains a spreadsheet of Congressmember data, including social media usernames.

Download our mirroed copy for this tutorial here: [http://nottwitter.danwin.com.s3.amazonaws.com/sunlight-foundation-congress-master.csv](http://nottwitter.danwin.com.s3.amazonaws.com/sunlight-foundation-congress-master.csv)

It is also in your **working-directory**


## Parsing CSV

We could parse with the string `split` method, but even a simple CSV file can have many ugly variations and irregularities. 

Use the CSV library instead:

``` ruby

data = get_data_file(CSV_DATA_MAIN_FILENAME)

CSV.new(data)

# or

FasterCSV.new(data)
```


### The headers option

``` ruby
FasterCSV.new(data, {:headers=>true})
```

Each data row is represented as a hash, with the column names conveniently used as keys.


### Convenience method for congressmembers

In our **my_code.rb**

def get_congress_data_from_file(fname)
  # pre: fname is a CSV file where congressmember data is located
  # returns: an array of Hash objects
  
  data = get_data_file(fname)
  
  
  if RUBY_VERSION > "1.9"
    return CSV.new(data, {:headers=>true} )
  else
    return FasterCSV.new(data, {:headers=>true})
  end
end
