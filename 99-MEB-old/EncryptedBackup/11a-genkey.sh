echo -n "my key phrase" |shasum -a 256 |cut -f1 -d\  > mykeyfile

cat mykeyfile
