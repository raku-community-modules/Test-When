use lib <lib>;
use Test;
use Test::Output;
use MONKEY-SEE-NO-EVAL;
output-from {
    EVALFILE 't/tests/01-env-smoke.t';
};

#say "Output was: [[[[[$o]]]]]";



