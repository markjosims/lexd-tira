lexicon=$1/lexicon.lexd
att_gen=$1/generator.att
hfst_gen=$1/generator.hfst
analyzer=$1/analyzer.bin
sed "s\\High/'\u0301'/g" $lexicon > $lexicon.tmp
# sed "/s\\Low/'\u0300'" -i $lexicon.tmp
lexd $lexicon > $att_gen
# rm $lexicon.tmp
sed -e 's/[[:space:]]*$//g' -i $att_gen
lt-comp rl $att_gen $analyzer
hfst-txt2fst $att_gen -o $hfst_gen