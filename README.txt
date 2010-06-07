= pkg_install

* http://github.com/godrin/pkg_install

== DESCRIPTION:

This is a common front-end to operating systems package management.
It will help you install needed developer-packages for your extensions.
It's inspired by puppet, but aimed at usage on the desktop or within
gem-configuration.

== FEATURES/PROBLEMS:

Features:
* Install packages on Ubuntu using simple name-mapping

== SYNOPSIS:

From bash:
> pkg_install install libsdl-image

From Ruby/extconf:

require 'rubygems'
require 'pkg_install'

PkgInstall::install("libsdl")

== REQUIREMENTS:

* facter (subproject of puppet)

== INSTALL:

for now:
* git clone ??????github.com/godrin/pkg_install

later on:

* gem install pkg_install

== DEVELOPERS:

After checking out the source, run:

  $ rake newb

This task will install any missing dependencies, run the tests/specs,
and generate the RDoc.

== LICENSE:

(The MIT License)

Copyright (c) 2010 David Kamphausen

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
