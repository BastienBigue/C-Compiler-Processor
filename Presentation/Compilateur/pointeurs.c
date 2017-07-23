int main() {
	int b = 12 ; 
	int * p = &b ; 
	b = (*p)*2 ; 
	printf((*p)) ; 
	printf(b) ; 
	
	int * a = NULL ; 
	printf(a) ; 
	printf((*a)) ; 
	return 0;
}
