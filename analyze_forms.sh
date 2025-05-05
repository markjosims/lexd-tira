analyzer=$1/analyzer.bin
cat $2 | lt-proc $analyzer && echo