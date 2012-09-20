---
layout: post
title: "Plucking out values"
date: 2012-09-20 04:01
comments: true
categories: 
problem: "How can easily collect just one attribute from a collection of Twitter account info or tweets?"
solution: "Use collection methods to transform collections to a particular value"
---

Sometimes, we just want *one* value from a collection, just like when we wanted the Twitter account names from each line in the Congressmembers' datafile. To make an array of these values, we can use `each` to fill a new array:


``` ruby
load './my_code.rb'

cmember_data = get_congress_data_from_file( CSV_DATA_MAIN_FILENAME )
cmember_twitter_names = []

cmember_data.each do |c|
	cmember_twitter_names << c['twitter_id']
end	

```

## Transforming an array

Creating an array of values plucked out of a collection is such a common pattern that Ruby has the `map` method (also known as `collect`)


``` ruby
load './my_code.rb'

cmember_data = get_congress_data_from_file( CSV_DATA_MAIN_FILENAME )
cmember_twitter_names = cmember_data.map do |c|
	c['twitter_id']
end
```

The `do..end` block can also be expressed with **curly braces**

``` ruby
load './my_code.rb'

cmember_data = get_congress_data_from_file( CSV_DATA_MAIN_FILENAME )
cmember_twitter_names = cmember_data.map{ |c| c['twitter_id'] }

```

Think of the code inside these blocks as methods. Like methods, the last line is the **return** value:

``` ruby
arr = ["cat", "dog", "mouse"]
new_arr = arr.map{|a| a.upcase}
#=> ["CAT", "DOG", "MOUSE"]
````

``` ruby
arr = [1, 2, 3]

arr.map do |a|
	b = a + 1
	c = b * 2
end

#=> [4, 6, 8]

```

## Sort an array

(draft)

``` ruby
[1, 6, -3, 100, -200].sort
```

``` ruby
cmember_data.map{ |c| c['lastname'] }.sort
```


## The sort method


The `sort` method also accepts a block, for cases when a collection's data objects need custom sorting methods:

``` ruby
cmember_data.sort{|c| c['lastname']}
```

## Exercise

Sort the congressmembers by highest tweet rate.

