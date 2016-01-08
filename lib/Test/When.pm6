sub EXPORT (*@args, *%args) {
    my $valid-env-keywords
    = set <smoke interactive extended release author network>;

    @args ⊆ $valid-env-keywords
        or fail "Positional arguments can only be $valid-env-keywords";

    %args ⊆ <libs modules>
        or fail "Only `libs` and `modules` positional arguments are supported";



    return {};
}

unit package Test::When:ver<1.001001>;

sub skip-all (Str $message) {
    say "1..0 # SKIPPING test: $message";
    exit 0;
}