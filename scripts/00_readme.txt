

NB: the xml output can be easly and transparently tranformed into a simple HTML format!

1. adjust the in/out-paths in the script
my $inFile = 'gogo_input/Tarjentsj_RU_SA_1.A.csv';
my $outFile = 'o_put.xml';

2. run
PERL_UNICODE=SAD perl csv2xml_rus2sjd.pl

3. check the output file

<?xml version="1.0" encoding="UTF-8"?>
<r>
  <e id="1" l="16">
    <p id="1">По-русски (böjd)</p>
    <p id="2">По-русски (grundform)</p>
    <p id="3">(ordklass)</p>
    <p id="4">Са̄мас (böjd)</p>
    <p id="5">Са̄мас (grundform)</p>
    <p id="6">(varianter)</p>
    <p id="7">Stadieväxling</p>
    <p id="8">Ссылка (länk)</p>
    <p id="9">Пример на русском 1 (exempel Ru 1)</p>
    <p id="10">Пример са̄мас 1 (exempel Sa 1)</p>
    <p id="11">Пример на русском 2 (exempel Ru 2)</p>
    <p id="12">Пример са̄мас 2 (exempel Sa 2)</p>
    <p id="13">Пример на русском 3 (exempel Ru 3)</p>
    <p id="14">Пример са̄мас 3 (exempel Sa 3)</p>
    <p id="15">Пример на русском 4 (exempel Ru 4)</p>
    <p id="16">Пример са̄мас 4 (exempel Sa 4)</p>
  </e>
  <e id="2" l="16">
    <p id="1">азартнее</p>
    <p id="2">_xxx_2</p>
    <p id="3">прил. (ср.ст.)</p>
    <p id="4">удла</p>
    <p id="5">_xxx_5</p>
    <p id="6">_xxx_6</p>
    <p id="7">_xxx_7</p>
    <p id="8">(см. удлэнне)</p>
    <p id="9">_xxx_9</p>
    <p id="10">_xxx_10</p>
    <p id="11">_xxx_11</p>
    <p id="12">_xxx_12</p>
    <p id="13">_xxx_13</p>
    <p id="14">_xxx_14</p>
    <p id="15">_xxx_15</p>
    <p id="16">_xxx_16</p>
  </e>
  <e id="3" l="16">
    <p id="1">бабушке</p>
    <p id="2">_xxx_2</p>
    <p id="3">сущ. (ед.ч., дат.-напр.)</p>
    <p id="4">а̄кне</p>
    <p id="5">_xxx_5</p>
    <p id="6">_xxx_6</p>
    <p id="7">_xxx_7</p>
    <p id="8">(см. а̄ка)</p>
    <p id="9">_xxx_9</p>
    <p id="10">_xxx_10</p>
    <p id="11">_xxx_11</p>
    <p id="12">_xxx_12</p>
    <p id="13">_xxx_13</p>
    <p id="14">_xxx_14</p>
    <p id="15">_xxx_15</p>
    <p id="16">_xxx_16</p>
  </e>
.....
</r>

Each field is debuggable with a simple grep:

scripts>g '<p id="2">' o_put.xml |sort|uniq -c|sort -nr
 768     <p id="2">_xxx_2</p>
   1     <p id="2">По-русски (grundform)</p>

 ==> there is no value for field 2

scripts>g '<p id="16">' o_put.xml |sort|uniq -c|sort -nr
 768     <p id="16">_xxx_16</p>
   1     <p id="16">Пример са̄мас 4 (exempel Sa 4)</p>

 ==> there is no value for field 16

