#!/usr/bin/perl -w
use utf8 ;

# Simple script to convert csv to html
# For input/outpus examples, see below.
my $inFile = 'gogo_input/Tarjentsj_RU_SA_1.A.csv';
my $outFile = 'o_put.xml';
my $eCounter = 0;
my $lemma = 'p_01'; 
my $lemma2 = 'p_02';
my $POS = 'p_03';
my $trans = 'p_04';
my $trans2 = 'p_05';
my $var = 'p_06';
my $CG = 'p_07';
my $syn = 'p_08';
my $ex1 = 'p_09';
my $extrans1 = 'p_10';
my $ex2 = 'p_11';
my $extrans2 = 'p_12';
my $ex3 = 'p_13';
my $extrans3 = 'p_14';
my $ex4 = 'p_15';
my $extrans4 = 'p_16';

open (OUTFILE, '>', "$outFile");
open (INFILE,"$inFile") || die "Can't Open File: $inFile\n";

print OUTFILE '<?xml version="1.0" encoding="UTF-8"?>'."\n";
print OUTFILE '<r>'."\n";

# while (<INFILE>) {
#   chomp;
#   my @current_data = split /\t/ ;
#   $eCounter++;  
#   print OUTFILE '  <e id="'.$eCounter.'" l="'.scalar(@current_data).'">'."\n";
#   for my $elem (@current_data) {
#     print OUTFILE '    <p>'.$elem.'</p>'."\n";
#   }
#   print OUTFILE '  </e>'."\n";
# }

while (<INFILE>) {
  chomp;

 my @current_data = ($lemma, $lemma2, $POS, $trans, $trans2, $var, $CG,  $syn, $ex1, $extrans1, $ex2, $extrans2, $ex3, $extrans3, $ex4, $extrans4) = split /\t/;
  $eCounter++;  
  print OUTFILE '  <e id="'.$eCounter.'" l="'.scalar(@current_data).'">'."\n";
  
  for my $e (0 .. $#current_data) {      # traverse the array containing the 16 variables
    my $current_s = $current_data[$e];   # $current_data[$e] is the content of the variable at index e
    $current_s =~ s/^\s+//;              # delete initial whitespace
    $current_s =~ s/\s+$//;              # delete final whitespace
                                         # thus, if whitespace only, delete it all

    if ($current_s eq ''){
      $current_s = $e+1;
      $current_s = '_xxx_'.$current_s;
  }

    print OUTFILE '    <p id="',$e+1,'">'.$current_s.'</p>'."\n";
  }

  print OUTFILE '  </e>'."\n";

}

print OUTFILE '</r>';
print "$inFile done!\n";
close INFILE;
close OUTFILE;
exit 0;

#     1	По-русски (böjd)
#     2	По-русски (grundform)
#     3	(ordklass)
#     4	Са̄мас (böjd)
#     5	Са̄мас (grundform)
#     6	(varianter)
#     7	Stadieväxling
#     8	Ссылка (länk)
#     9	Пример на русском 1 (exempel Ru 1)
#    10	Пример са̄мас 1 (exempel Sa 1)
#    11	Пример на русском 2 (exempel Ru 2)
#    12	Пример са̄мас 2 (exempel Sa 2)
#    13	Пример на русском 3 (exempel Ru 3)
#    14	Пример са̄мас 3 (exempel Sa 3)
#    15	Пример на русском 4 (exempel Ru 4)
#    16	Пример са̄мас 4 (exempel Sa 4)

# Example input:
#
# се̄ййп_N_ANIMAL_хвост длинный, длинный хвост
# кӣдтжэва_N_ANIMAL, LIVING-PLACE_животное домашнее, домашнее животное
# оа̄к_N_ANIMAL_лосиха


#Target output:
#
#  <entry>
#    <lemma>на̄ввьт</lemma>
#    <pos class="N"/>
#    <translations>
#      <tr xml:lang="rus">животное домашнее</tr>
#      <tr xml:lang="rus">домашнее животное</tr>
#    </translations>
#    <semantics>
#      <sem class="ANIMAL"/>
#      <sem class="LIVING-PLACE"/>
#    </semantics>
#    <sources>
#      <book name="l1"/>
#    </sources>
#  </entry>
