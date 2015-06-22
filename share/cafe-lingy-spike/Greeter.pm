use strict;
use warnings;
use v5.10;

package Greeter;
use Moose;

sub greet {
  my ($self, $name) = @_;
  say "Hello $name";
}

1;
