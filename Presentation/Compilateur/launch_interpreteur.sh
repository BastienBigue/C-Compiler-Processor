if [ "$1" != "" ]; then
	cd ./interpreteur
	make 
	cd ..
	make
	./parser < $1 > ./result.asm
	./interpreteur/interpreteur < result.asm
else
    echo "Give me a file pls :'("
fi


