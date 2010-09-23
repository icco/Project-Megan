# Project Megan

<http://xkcd.com/796/>

Ya we know... It's too soon.

## Installation

Install the gems by running:

    `sudo gem install `cat .gems`

This will install the following:

 * mongo
 * bson
 * bson_ext
 * mongo_mapper
 * less
 * sinatra
 * rdiscount
 * github-markup

You'll also need the following if you want to test "quickly":

 * rake
 * shotgun

## Features Needed

I love the concept of [README driven development][rdd], but I usually follow it
by using a whiteboard with a list of features I want and stuff I still need to
code, instead of actually writting something coherent. So this is my space in
the Readme to deal with that.

__TODO__:

 * Make a view page that displays user info properly
 * add support for user images
 * deal with editing/deleting via the password
 * link from view page back to index
 * validate incomming data
 * email password -- Maybe...
 * clean up code, write better documentation.
 * add support for markdown in long
   * write a sinatra helper to parse markdown

[rdd]: http://tom.preston-werner.com/2010/08/23/readme-driven-development.html

