# Project Megan

<http://xkcd.com/796/>

Project Megan (better name needed...) is a website based on the afore-mentioned
comic to allow people to report people who are bad dates. We will allow users
to post a short summary, and an optional long form story. All submissions will
be anonymous but give the original author the ability to delete their post.

## Installation

If for some reason you want to run a local copy, or maybe help development,
follow the steps below to get a copy running on your machine.

Install the gems by running:

    sudo gem install `cat .gems`

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
code, instead of actually writing something coherent. So this is my space in
the Readme to deal with that.

__TODO__:

 * Make a view page that displays user info properly
 * add support for user images
 * deal with editing/deleting via the password
 * link from view page back to index
 * validate incoming data
 * email password -- Maybe...
 * clean up code, write better documentation.
 * add support for markdown in long
   * write a sinatra helper to parse markdown

## Authors

 * Nat Welch

## License

[The MIT License][cc-mit]

Copyright (c) 2010 Nathaniel Welch

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

[rdd]: http://tom.preston-werner.com/2010/08/23/readme-driven-development.html
[cc-mit]: http://creativecommons.org/licenses/MIT/

