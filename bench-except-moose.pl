use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/lib";
use Benchmark ':all';
use Module::Load 'load';
use MyClasses;
use MyBench;

my $N        = 1_000_000;
my @versions = qw(Mojolicious Mouse Moo Class::XSAccessor);
my @names = qw(NewMojo Mojo::Base Mouse::Immutable Mouse Moo Pure XSAccessor);

print "perl: $]\nIterations: $N\n";
do { load $_; print "$_: ", $_->VERSION, "\n" }
  for @versions;


cmpthese($N, MyBench::build_bench(@names));

