int foisdeux(int c) {
	return 2*c ; 
}

int factoriellewhile(int c){
	int i = 1 ; 
	int res = 1 ; 
	while(i<=c) {
		printf(i) ; 
		if (i > 5) {
			res = 1000 ; 
			i = c+1 ; 
		}
		else {
			res = res*i ;
			i = i+1 ; 
		}
	}
	return res ; 
}

int main() {
	a = factoriellewhile(foisdeux(4)) ;
	printf(a);
	return 0;
}
