int foisdeux(int c) {
	return 2*c ; 
}

int factorielle(int c){
	int a ;
	if (c == 0)
	{
		a = 1;
	}
	else {
		printf(c) ; 
		a = factorielle(c-1);
		a = a * c ;
		printf(a);
	}
	return a ;
}

int main() {
	a = factorielle(foisdeux(4)) ;
	printf(a);
	return 0;
}
