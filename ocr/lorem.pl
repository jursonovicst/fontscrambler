#!/usr/bin/env perl

use Text::Lorem;

$num_args = $#ARGV + 1;
if ($num_args != 1) {
    print "\nUsage: lorem.pl seed\n";
    exit;
}
srand($ARGV[0]);

my $text = Text::Lorem->new();
$paragraphs = $text->paragraphs(50);

print $paragraphs;
