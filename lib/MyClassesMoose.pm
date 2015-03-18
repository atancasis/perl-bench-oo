package MyClassesMoose;
use strict;
use warnings;
{

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

1;
