 for x in ../data/*.txt; do    echo $x;   bash book_summary.sh $x Author; done > authors.txt
 for x in ../data/*.txt; do    echo $x ;   bash book_summary.sh $x Release; done > releases.txt 
 ls
 mkdir ../results
 mv authors.txt releases.txt ../results
 history 6 > summarize_all_books.sh


