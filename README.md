[![Actions Status](https://github.com/raku-community-modules/Test-When/actions/workflows/linux.yml/badge.svg)](https://github.com/raku-community-modules/Test-When/actions) [![Actions Status](https://github.com/raku-community-modules/Test-When/actions/workflows/macos.yml/badge.svg)](https://github.com/raku-community-modules/Test-When/actions) [![Actions Status](https://github.com/raku-community-modules/Test-When/actions/workflows/windows.yml/badge.svg)](https://github.com/raku-community-modules/Test-When/actions)

NAME
====

Test::When - Selectively run tests based on the environment and installed modules and libs

SYNOPSIS
========

```raku
use Test::When <release author>,
  :modules<Extra::Features  More::Options>,
  :libs( 'someClib', any(<sqlite3 mysql pg>) );
```

UNIMPLEMENTED / SPEC
====================

The `:modules` and `:libs` restrictions aren't yet implemented, but will be soon. Checkout the [SPECIFICATION](SPECIFICATION.md) for details on what they will do.

DESCRIPTION
===========

This module lets you write selective tests that will only run when user requested, say, network tests to run, or when the runner of the tests explicitly requested any interactive tests to be avoided. These checks are heavily based on the decisions by the [Lancaster Consensus](https://github.com/Perl-Toolchain-Gang/toolchain-site/blob/master/lancaster-consensus.md#environment-variables-for-testing-contexts).

*Currently unimplemented.* The module also allows run tests only when a specific module or C library are installed. This is handy when your module offers extra optional functionality dependent on extra stuff, for example.

USAGE
=====

The type of tests your test file represents is specified on the `use` line of `Test::When` module.

Environmental Variable Controlled Tests
---------------------------------------

```raku
use Test::When <author extended>;
```

The type of test environment to look for is set by positional arguments provided on the `use` line. Multiple positional arguments can be combined. Whether your tests run depends on the set environmental variables.

The following positional arguments are supported:

### smoke

```raku
use Test::When <smoke>;
```

Tests to run when either `AUTOMATED_TESTING` or `ALL_TESTING` env vars are true.

### interactive

```raku
use Test::When <interactive>;
```

Tests must **NOT** be run when `NONINTERACTIVE_TESTING` is set to true, unless `ALL_TESTING` is also set to true.

### extended

```raku
use Test::When <extended>;
```

Tests to be run when either `EXTENDED_TESTING`, `RELEASE_TESTING`, or `ALL_TESTING` env var is set to true.

### release

```raku
use Test::When <release>;
```

Tests to be run when `RELEASE_TESTING` or `ALL_TESTING` env var is set to true.

### author

```raku
use Test::When <author>;
```

Tests to be run when `AUTHOR_TESTING` or `ALL_TESTING` env var is set to true.

### online

```raku
use Test::When <online>;
```

Tests to be run when `ONLINE_TESTING` or `ALL_TESTING` env var is set to true.

### Meaning of the Respected Environmental Variables

  * `AUTOMATED_TESTING`: if true, tests are being run by an automated testing facility and not as part of the installation of a module; smokers must set this to true; clients (e.g. `zef`) must not set this.

  * `NONINTERACTIVE_TESTING`: if true, tests should not attempt to interact with a user; output may not be seen and prompts will not be answered.

  * `EXTENDED_TESTING`: if true, the user or process running tests is willing to run optional tests that may take extra time or resources to complete. Such tests must not include any development or QA tests. Only tests of runtime functionality should be included.

  * `RELEASE_TESTING`: if true, tests are being run as part of a release QA process; clients must not set this variable.

  * `AUTHOR_TESTING`: if true, tests are being run as part of an author's personal development process; such tests may or may not be run prior to release. clients must not set this variable. Distribution packagers (ppm, deb, rpm, etc.) should not set this variable.

  * `ONLINE_TESTING`: unless true, tests must not attempt to access a network resource (such a website or attempt to query a network interface).

  * `ALL_TESTING`: if true, all possible tests will be run. That is, this module will NOT skip any tests it could possibly skip under other environment. This **includes** tests that require a particular module or C library to be installed.

AUTHOR
======

Zoffix Znet

COPYRIGHT AND LICENSE
=====================

Copyright 2016 - 2017 Zoffix Znet

Copyright 2020 - 2025 Raku Community

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

