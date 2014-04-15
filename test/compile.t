use strict;
use Test::More;

use CafeScript;
use IO::All;

my @tests = qw(
    Pegex-Pegex-AST
);

for my $test (@tests) {
    my $cafe = CafeScript->new(
        file => "test/$test.cafe"
    )->compile;

    is $cafe->generate('Perl'),
        io("test/$test.perl")->all,
        "Compile '$test' to Perl";

    is $cafe->generate('Ruby'),
        io("test/$test.perl")->all,
        "Compile '$test' to Ruby";
}
