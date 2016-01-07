[![Build Status](https://travis-ci.org/zoffixznet/perl6-Test-When.svg)](https://travis-ci.org/zoffixznet/perl6-Test-When)

# NAME

Test::When - Selectively run tests based on the environment and installed modules and libs

# SYNOPSIS

```perl6
    use Test::When <release author>,
        :modules<Extra::Features  More::Options>,
        :libs( 'someClib', any(<sqlite3 mysql pg>) );
```

# REPOSITORY

Fork this module on GitHub:
https://github.com/zoffixznet/perl6-Test-When

# BUGS

To report bugs or request features, please use
https://github.com/zoffixznet/perl6-Test-When/issues

# AUTHOR

Zoffix Znet (http://zoffix.com/)

# LICENSE

You can use and distribute this module under the terms of the
The Artistic License 2.0. See the `LICENSE` file included in this
distribution for complete details.
