# SimpleCov Rcov Formatter gem

Is a Rcov style formatter for the ruby 1.9+ coverage gem: [SimpleCov](http://github.com/colszowka/simplecov).

The target of this formatter is to cheat on **Hudson** so I can use the [Ruby metrics plugin](http://github.com/hudson/rubymetrics-plugin) with **SimpleCov**.

So if you are looking some kind of workaround to integrate **SimpleCov** with your **Hudson** + **Ruby metrics plugin** this is a beginning.

## Install

    $ [sudo] gem install simplecov_rcov

## Usage

    require 'simplecov_csv'
    SimpleCov.formatter = SimpleCov::Formatter::RcovFormatter

## TODO

The actual version generates only one simple **/rcov/index.html** file.

## Credits

* Author: [Fernando Guillen](http://fernandoguillen.info)
* Copyright: Copyright (c) 2010 Fernando Guillen
* License: Released under the MIT license.