package MyBench;
use strict;
use warnings;

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
