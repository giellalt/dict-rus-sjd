#!/usr/bin/perl -w
use utf8 ;


print STDOUT '<?xml version="1.0" encoding="UTF-8"?>'."\n";
print STDOUT '<r>'."\n";

while (<>) {
  chomp;
  my @current_data = split /\t/ ;
  $eCounter++; # entry counter
  # the l-attribute contains the length of the array for each line after the split operation
  # here you can see the difference between empty fields (non-existend in the array)
  # and fields with whitespaces (output as empty p-elements)
  print STDOUT '  <e id="'.$eCounter.'" l="'.scalar(@current_data).'">'."\n";

  for my $e (0 .. $#current_data) {

# ignore whitespace normalization
#     my $current_s = $current_data[$e];
#     $current_s =~ s/^\s+//;
#     $current_s =~ s/\s+$//;
     
#     if ($current_s eq ''){
#       $current_s = $e+1;
#       $current_s = '_xxx_'.$current_s;
#     }
     
    

     print STDOUT '    <p id="',$e+1,'">'.$current_data[$e].'</p>'."\n";
   }
  
  print STDOUT '  </e>'."\n";
}

print STDOUT '</r>';
print "Done!\n";
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

