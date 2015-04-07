#!/usr/bin/env perl
use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/lib";
use Benchmark ':all';
use Module::Load 'load';
use MyBench;
use MyClasses;

my $N        = 1_000_000;
my @versions = qw(Evo Mojolicious Moose Mouse Moo Class::XSAccessor);
my @names
  = qw(Evo::Base Mojo::Base Mouse Moo Moose::Immutable Pure);

print "perl: $]\nIterations: $N\n";
do { load $_; print "$_: ", $_->VERSION, "\n" }
  for @versions;


cmpthese($N, MyBench::build_bench(@names));

