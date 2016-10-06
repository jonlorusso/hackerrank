#!/usr/bin/env perl

use v5.10;

sub perimeter {
    my ( $sides ) = @_;
    my $perimeter = 0;
    $perimeter += $_ for @$sides;
    return $perimeter;
}

sub is_degenerate {
    my ( $sides ) = @_;
    $sides = [ sort { $a <=> $b } @$sides ];
    if ( ( $sides->[0] + $sides->[1] ) <= $sides->[2] ) {
        return 1;
    }
    return 0;
}

chomp(my $n = <>);
chomp(my @a = split / /, <>);

my $triangle;
if ( scalar @a == 3 ) {
    $triangle = [ @a ];
}
else {
    @a = sort { $a <=> $b } @a;
    my $found = 0;
    while ( ! $found && scalar @a >= 3 ) {
        $triangle =  [ @a[ ($#a - 2) .. $#a  ] ];
        if ( is_degenerate( $triangle ) ) {
            pop @a;
        }
        else {
            $found = 1;
        }
    }
}

say is_degenerate($triangle) ? -1 : join ' ' => @$triangle;
