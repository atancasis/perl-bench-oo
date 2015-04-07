package MyClasses;
use strict;
use warnings;

{

  package My::Pure;
  use strict;
  use warnings;
  sub new { my $class = shift; bless {@_}, $class }

  sub foo {
    return exists $_[0]{foo} ? $_[0]{foo} : $_[0]{foo} = 10 if @_ == 1;
    $_[0]{foo} = $_[1];
    $_[0];
  }

  sub bar {
    return $_[0]{bar} if @_ == 1;
    $_[0]{bar} = $_[1];
    $_[0];
  }

  sub baz {
    return $_[0]{baz} if @_ == 1;
    $_[0]{baz} = $_[1];
    $_[0];
  }

  #package My::Moose;
  #use Moose;
  #has foo => is => 'rw', default => 10;
  #has bar => is => 'rw';
  #has baz => is => 'rw';

  package My::Moose::Immutable;
  use Moose;
  has foo => is => 'rw', default => 10;
  has bar => is => 'rw';
  has baz => is => 'rw';
  __PACKAGE__->meta->make_immutable;


  package My::Mojo::Base;
  use Mojo::Base -base;
  has foo => 10;
  has 'bar';
  has 'baz';

  #package My::Mouse::Immutable;
  #use Mouse;
  #has foo => is => 'rw', default => 10;
  #has bar => is => 'rw';
  #has baz => is => 'rw';
  #__PACKAGE__->meta->make_immutable;

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

  package My::Evo::Base;
  use Evo::Base -base;
  has foo => 10;
  has 'bar';
  has 'baz';

  #package My::XSAccessor;
  #use strict;
  #use warnings;

  #use Class::XSAccessor {accessors => [qw(bar baz)], chained => 1,
  #  constructor => 'new'};

  #sub foo {
  #  return exists $_[0]{foo} ? $_[0]{foo} : $_[0]{foo} = 10 if @_ == 1;
  #  $_[0]{foo} = $_[1];
  #  $_[0];
  #}

}

1;
