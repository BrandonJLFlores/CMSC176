use strict;
use warnings;
use diagnostics;

use feature 'say';
use feature "switch";

#comment

print "Hello World\n";

my $name = 'Brandon';
my ($age, $street) = (40, '6-232 Pagsabungan');
my $my_info = "$name lives on \"$street\"\n";
$my_info = qq{$name lives on "$street"\n};

print $my_info;

my $bunch_on_info = <<"END";
gihinganlan ko niyag bahong bilat
charot
joke only
END

say $bunch_on_info;


my $big_int = 22;
printf("%u \n", $big_int + 1);

my $big_float = .1000000000000001;
printf("%.16f \n", $big_float + .1000000000000001);
my $first = 1;
my $second = 2;
($first, $second) = ($second, $first);
say " $first $second";