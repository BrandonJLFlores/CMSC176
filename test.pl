use strict;
use warnings;
use diagnostics;


use feature "switch";






my ($age, $street) = (40, '6-232 Pagsabungan');
my $my_info = "$name lives on \"$street\"\n";
$my_info = qq{$name lives on "$street"\n};



my $bunch_on_info = <<"END";
gihinganlan ko niyag bahong bilat
charot
joke only
END




my $big_int = 22;
printf("%u \n", $big_int + 1);


printf("%.16f \n", $big_float + .1000000000000001);
my $first = 1;
my $second = 2;
($first, $second) = ($second, $first);
