#!/usr/bin/perl

use v5.10;
use POSIX;

chomp( my $t = <> );
for ( 1 .. $t ) {
    chomp( my ( $n, $k ) = split / /, <> );
    
    my @permutation;
    
    if ( $k == 0 ) {
        @permutation = 
            map { $_ + 1 }
            map { $_ % $n }
            map { $_ + $k } ( 0 .. ( $n - 1 ) );
    }
    elsif ( ( $n % $k ) == 0 ) {
        @permutation = 
            map { $_ == 0 ? $_ + $n : $_ }
            map { $_ % $n }
            map {
                my $sign = ceil( $_ / $k ) % 2 == 0 ? -1 : 1;
                $_ + ( $k * $sign );
            } ( 1 .. $n );
    }
    else {
        @permutation = -1;
    }   

    say join ' ' => @permutation;
}
