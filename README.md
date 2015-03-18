# perl-test-oo
Testing different OO modules

## Install

    cpanm -n Mojolicious Moose Mouse Moo

## Running

    perl bench.pl | tee results.txt

## Results
The results are not very honest (because Mojo:Base makes much less than others, and Moose can do much more, and this test
doesn't use all of the features), but at least they show that you don't need to bother about choosing OO module - just use your favourite (but certainly need to worry about using Moose without `make_immutable`)
