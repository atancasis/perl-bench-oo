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

}

sub get_awesome_object {
  my ($class, $bar) = @_;
  my $obj = $class->new(bar => $bar);
  $obj->baz($obj->foo + $obj->bar);
  $obj;
}

sub build_bench {
  my @names = @_;
  my %hash;
  foreach my $name (@names) {
    my $k = 0;
    $hash{$name} = sub {
      my $obj = get_awesome_object("My::$name", ++$k);
      die unless $obj->baz == $k + 10;
    };
  }
  \%hash;
}

1;
