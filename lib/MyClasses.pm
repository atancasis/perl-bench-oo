package MyClasses;
use strict;
use warnings;

{

  package My::Pure;
  use strict;
  use warnings;
  sub new { my $class = shift; bless {@_}, $class }

  sub foo {
    my $obj = shift;
    return $obj->{foo} //= 10 unless @_;
    $obj->{foo} = shift;
    $obj;
  }

  sub bar {
    my $obj = shift;
    return $obj->{bar} unless @_;
    $obj->{bar} = shift;
    $obj;
  }

  sub baz {
    my $obj = shift;
    return $obj->{baz} unless @_;
    $obj->{baz} = shift;
    $obj;
  }

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

  package My::XSAccessor;

  sub new {
    my ($class, %args) = @_;
    $args{foo} //= 10;
    bless \%args, $class;
  }

  use Class::XSAccessor {accessors => ['foo'], chained => 1};
  use Class::XSAccessor {accessors => ['bar'], chained => 1};
  use Class::XSAccessor {accessors => ['baz'], chained => 1};

}

1;
