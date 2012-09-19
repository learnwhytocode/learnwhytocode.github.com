---
layout: post
title: "Organizing your code environment"
date: 2012-09-12 03:15
comments: true
categories: 
problem: "Typing out the code for common tasks is getting repetitive"
solution: "Let's write our own method to wrap these steps in a single call."
---

Let's build off of the **my_code.rb** file we made in the last chapter:

{% include_code organizing-the-code/my_code.rb %}


It's been kind of annoying to re-formulate the URL for getting tweets and user info. So let's use those constants to write methods to conveniently generate the needed URLs.

(this is just practice with no new concepts)



# getting a file

# parsing a twitter account info json

# retrieve an array of tweets

# moving code to another file


```

def get_from_url(u)
# pre: u is an address to a file
# returns: a response from the server

end

def form_twitter_account_info_url(screen_name)

end

def form_tweets_page_url(screen_name, page)

end



def get_twitter_account_info(screen_name)

end

def get_tweets_page(screen_name, page)

end

```
