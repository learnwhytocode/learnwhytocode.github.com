---
layout: post
title: "Handle data files faster with Hashes"
date: 2012-09-12 05:20
comments: true
categories: 
problem: "Arrays are cumbersome when trying to get the actual column of a given line."
solution: "Use the FasterCSV library and Hash objects to simplify reading the datafile."
---

We finished the last chapter with this annoyance:

Given a tab-delimited file where the first line is the name of columns, how do we get the `tktwittername` value for any given line?

We basically have to find the numerical index where `tktwittername` exists in the array of column names.

```
#TK irb example in which we load file, guess index

```

The fundamental problem here is that the numerical index of TK9 is perfectly understandable by the Ruby interpreter. But `TK9` does not inherently mean *anything* to a human, in this case, the *programmer*.

If only we could give human-readable indicies for the values of each line.


## The FasterCSV library



## The Hash






##### Exercises

Using the `FasterCSV` library, open the `TKdatafileCONSTANT` and loop through each line and print out the URLs needed to access every Congressmember's Twitter account info.

``` lang:ruby

```