#!/usr/bin/perl

# ----------------------------------------------------------------------
# $Id: html-encode 57 2006-04-13 02:22:53Z dlc $
# This simple script takes data and HTML encodes it.
# If passed a -e, it will use entities instead of symbolic names
# ----------------------------------------------------------------------

use utf8;
binmode STDOUT, 'utf8';
use Encode;

use strict;
use vars qw($opt_h $opt_e $encoder);

use Getopt::Std qw(getopts);
use HTML::Entities;

getopts('eh');

if (defined $opt_h) {
    require File::Basename;
    $0 = File::Basename::basename($0);
    print <<HELP;
$0 -- Encode HTML files

Usage:

    $0 [-e] FILE [, FILE[, FILE]]

HTML encodes the contents of FILE (or stdin, if no files are
given) to stdout.  If -e is passed, $0 does numeric encoding,
i.e., &#x3C; and &#x3E; instead of &lt; and &gt;.

HELP
    exit 0;
}

if (defined $opt_e) {
    $encoder = \&HTML::Entities::encode_entities_numeric;
}
else {
    $encoder = \&HTML::Entities::encode_entities;
}

# If passed filenames on the command line, iterate through those,
# emitting to STDOUT; otherwise, read STDIN.
if (@ARGV) {
    require IO::File;
    for my $file (@ARGV) {
        my $fh = IO::File->new($file);

        unless ($fh) {
            warn "Can't read $file: $!\n";
            next;
        }

        while (<$fh>) {
            my $line = decode('UTF-8', $_);
            print $encoder->($line);
            #print $encoder->($_);
        }

        unless (close $fh) {
            warn "Error closing $file: $!\n";
        }
    }
}
else {
    while (<>) {
        my $line = decode('UTF-8', $_);
        print $encoder->($line);
        #print $encoder->($_);
    }
}

exit 0;
