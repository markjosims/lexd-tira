lexicon=$1/lexicon.lexd
att_gen=$1/generator.att
hfst_gen=$1/generator.hfst
analyzer=$1/analyzer.bin
lexd $lexicon > $att_gen
sed -e 's/[[:space:]]*$//g' -i $att_gen
lt-comp rl $att_gen $analyzer
hfst-txt2fst $att_gen -o $hfst_gen