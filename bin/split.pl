#!/usr/bin/perl
use strict;
use warnings;
print "Digite uma lista de nomes separada por espaço e tecle enter: ";
my $nomes = <STDIN>;
chomp $nomes;
my @lista = split (/ /, "$nomes"); 
