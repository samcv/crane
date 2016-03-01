use v6;
use lib 'lib';
use lib 't/lib';
use Test;
use Crane;
use TestCrane;

plan 1;

subtest
{
    my %expected{List};

    # Any
    my $x = 1;
    %expected = () => 1;
    is Crane.flatten($x), %expected, 'Is expected value';

    # Associative
    my %h = :a<alpha>,:b<bravo>,:c<charlie>;
    %expected = ("a",) => "alpha", ("b",) => "bravo", ("c",) => "charlie";
    is Crane.flatten(%h), %expected, 'Is expected value';

    # Positional
    my $a = qw<zero one two>;
    %expected = (0,) => "zero", (1,) => "one", (2,) => "two";
    is Crane.flatten($a), %expected, 'Is expected value';

    my %data = %TestCrane::data;
    %expected =
        ("legumes", 0, "instock") => 4,
        ("legumes", 0, "name")    => "pinto beans",
        ("legumes", 0, "unit")    => "lbs",
        ("legumes", 1, "instock") => 21,
        ("legumes", 1, "name")    => "lima beans",
        ("legumes", 1, "unit")    => "lbs",
        ("legumes", 2, "instock") => 13,
        ("legumes", 2, "name")    => "black eyed peas",
        ("legumes", 2, "unit")    => "lbs",
        ("legumes", 3, "instock") => 8,
        ("legumes", 3, "name")    => "split peas",
        ("legumes", 3, "unit")    => "lbs";
    is Crane.flatten(%data), %expected, 'Is expected value';
}

# vim: ft=perl6 fdm=marker fdl=0