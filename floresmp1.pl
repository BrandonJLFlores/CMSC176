use strict;
use warnings;
use diagnostics;
use feature 'say';
use feature "switch";

sub  trim { my $s = shift; $s =~ s/[\n\r\s\w]+//g; return $s };
my $data;#my $filename = 'input.txt';
my $filename;
# = 'input2.txt';
my @tokens;
my @puncts;
my $ii = 1;
while($ii == 1){
		print  "Enter filename: ";
		$filename = <STDIN>; 
		chomp $filename; 
		if (open(my $fh, '<:encoding(UTF-8)', $filename)) {
			$ii = 0;
		} else {
		  say "Re enter correct filename";
		}}
		
#FILE READ
    open(my $fh, '<', $filename) or die "cannot open file $filename";
    {
        local $/;
        $data = <$fh>;
    }
    close($fh);
#tokenize all non "word (w)" character and hyphen
my $ctr = 1;@tokens = split(/[^\w-]+/, $data);
@tokens = map { lc } @tokens; #tolowercase
@tokens = sort @tokens; #sort

my $numberTokens = @tokens;
#tokenize character by character;  trim alll "word character"
my $trimmed = trim($data);
@puncts = split(//, $trimmed);
my %sums;
map {$sums{$_}++} @puncts;
#remove duplicates
my %seen=();
my @unique_tok = grep { ! $seen{$_} ++ } @tokens;
my $numberTypes = @unique_tok;

my $x=1;
my $userinput;
my $deleted;
my $len;
my $newstring;my @words;
while($x != 2){
	@words = ();
	print "\nMenu:\n1) Search\n2) Quit\nEnter choice: ";
    $x = <STDIN>; 
	chomp $x; 
	if($x == 1){
		print  "Enter a word: ";
		$userinput = <STDIN>; 
		chomp $userinput; 
		$userinput = lc $userinput;
	
		if(index($userinput, "*") != -1){
			if (index($userinput, "*") == 0 && index($userinput, "?") == (length($userinput) - 1)) {
				# both *  ?
				$userinput = $userinput . '$';
			} elsif (index($userinput, "?") == 0 && index($userinput, "*") == (length($userinput) - 1)) {
				# both ? *
				$userinput = '^' . $userinput ;
			} elsif(index($userinput, "*") == 0 && index($userinput, "*") == (length($userinput) - 1)){
				# both * *
			} elsif(index($userinput, "*") == (length($userinput) - 1)){
				# last *
				$userinput = '^' . $userinput ;
			} else{
				# first *
				$userinput = $userinput . '$';
			}
		} elsif(index($userinput, "?") != -1){
				#last ?
				$userinput = '^' . $userinput .'$';
		}else{
			#none
			$userinput = '^' . $userinput .'$';
		}
		
		# substitute * to .+ and ? to .
		$userinput =~s/\*/\.\+/g;
		$userinput =~s/\?/\./g;		#Printing
		@words = grep( /$userinput/, @unique_tok ) ;
		say "\nNumber of tokens: $numberTokens";
		say "\n----------Tokens----------";
		print join( ', ', @tokens );
		say "\n\nNumber of types: $numberTypes";
		say "\n----------Types----------";
		print join( ', ', @unique_tok );
		say "\n\n----------Punctuations----------";
		print "$_ = $sums{$_}\n" foreach sort keys %sums;
		say "\n\n----------WORD/S FOUND----------";
		print join( ', ', @words );	}elsif( $x == 2){
			say "Quitting";
	}else{
		say "Invalid\n";
	}
	say "";}