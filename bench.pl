use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/lib";
use Benchmark ':all';
use Module::Load 'load';
use MyBench;
use MyClasses;

my $N        = 1_000_000;
my @versions = qw(Mojolicious Moose Mouse Moo Class::XSAccessor);
my @names
  = qw(Mojo::Base Mouse::Immutable Mouse Moo Moose Moose::Immutable Pure XSAccessor);

print "perl: $]\nIterations: $N\n";
do { load $_; print "$_: ", $_->VERSION, "\n" }
  for @versions;


cmpthese($N, MyBench::build_bench(@names));

