# perl-bench-oo
Benchmarking different OO modules

This benchmark performs a roundip for different OO types in perl:
- create an object using a new method with arguments
- set an object's attribute
- get an object attribute (twice)
- get an object attribute with default value

## Install

    cpanm -n Evo Mojolicious Moose Mouse Moo Class::XSAccessor

## Running

    perl bench.pl | tee results.txt

## Results
The results are not very honest (because Mojo:Base and Evo can make much less than others, and Moose can make much more, and this test
doesn't use all of the features), but at least they show that you don't need to bother about choosing OO module - just use your favourite depending on your needs. (But certainly need to worry about using Moose without `make_immutable`)

Also you have to know that the dependency of your final application's performance from chosen OO isn't linear. So if you'll improve it for 100%, the performance of your whole app can increase for 10% only.
