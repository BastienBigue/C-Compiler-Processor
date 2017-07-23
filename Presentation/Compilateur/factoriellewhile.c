int foisdeux(int c) {
	return 2*c ; 
}

int factoriellewhile(int c){
	int i = 1 ; 
	int res = 1 ; 
	while(i<=c) {
		res = res*i ;
		i = i+1 ; 
	}
	return res ; 
}

int main() {
	a = factoriellewhile(foisdeux(4)) ;
	printf(a);
	return 0;
}
