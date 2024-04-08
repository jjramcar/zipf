#Get whatever info the user specifies from project Gutenberg eBook
#Usage: bash book_summary.sh /path/to/file.txt info
head -n 17 $1 | tail -n 8 | grep $2






