#!perl
use strict;
use warnings;
use Benchmark ':all';
use Module::Load 'load';

my $N        = 500_000;
my @versions = qw(Mojolicious Mouse Moose Moo);
my @names = qw(Mojo::Base Mouse::Immutable Mouse Moose::Immutable Moose Moo);
local $| = 1;

{

  package My::Mojo::Base;
  use Mojo::Base -base;
  has foo => 10;
  has 'bar';
  has 'baz';

  package My::Mouse::Immutable;
  use Mouse;
  has foo => is => 'rw', default => 10;
  has bar => is => 'rw';
  has baz => is => 'rw';
  __PACKAGE__->meta->make_immutable;

  package My::Mouse;
  use Mouse;
  has foo => is => 'rw', default => 10;
  has bar => is => 'rw';
  has baz => is => 'rw';

  package My::Moo;
  use Moo;
  has foo => is => 'rw', default => 10;
  has bar => is => 'rw';
  has baz => is => 'rw';

  package My::Moose;
  use Moose;
  has foo => is => 'rw', default => 10;
  has bar => is => 'rw';
  has baz => is => 'rw';

  package My::Moose::Immutable;
  use Moose;
  has foo => is => 'rw', default => 10;
  has bar => is => 'rw';
  has baz => is => 'rw';
  __PACKAGE__->meta->make_immutable;

}

sub get_obj {
  my ($class, $bar) = @_;
  my $obj = $class->new(bar => $bar);
  $obj->baz($obj->foo + $obj->bar);
  $obj;
}


print "perl: $]\nIterations: $N\n";
do { load $_; print "$_: ", $_->VERSION, "\n" }
  for @versions;

my %hash;
foreach my $name (@names) {
  my $k = 0;
  $hash{$name} = sub {
    my $obj = get_obj("My::$name", ++$k);
    die unless $obj->baz == $k + 10;
  };
}

cmpthese($N, \%hash);

