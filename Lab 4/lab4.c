char plain[132] __attribute__((section(".data")));

int coded[] __attribute__((section(".data"))) = {0x57aa578d, 0x5bea35dc, 0xfaad75f4, 0x97be0436, 0xc85bc050, 0x03470e2b, 0x2d4db7ff, 0xcd1ec180, 0x51af0923, 0x3aa1dd7c, 0x9bd17153, 0x46f10c48, 0x5b785b9b, 0x4c4be5dc, 0xa7ffa660, 0xa09b093e, 0xa8244ea4, 0xb2f6a668, 0xe805b2c8, 0xeac7772e, 0x474a6730, 0x5ed34134, 0x8eb03b48, 0x7d8469cb, 0x46a199b8, 0xb7d84719, 0xe2c8cac8, 0xaf9c2d6f, 0x14de783c, 0x7b8d7321, 0xfe62aed8, 0x478429ef, 0x38d8c625, 0x8f7faced, 0x4e2044d3, 0x56285143, 0xc581ba55, 0x29899495, 0xb4c48a07, 0x0ebdc017, 0x63fb15dd, 0xda1da98a, 0xb0339a29, 0xbf35cc8a, 0x2445d505, 0x1385cc56, 0x4114e805, 0xd36704a2, 0x969e529d, 0xfc55f842, 0xd3ee536e, 0xd492f1ec, 0x17ed0922, 0xc8756b9e, 0x57f07d66, 0x4c5074ac, 0x9bb75c7e, 0x3a6ee2da, 0xfc77af3a, 0xb7c3404d, 0xe658045a, 0x15b1d3b3, 0x1f01d14a, 0x6da11831, 0xb08b0fce, 0xf9d60c53, 0x9d591c0a, 0x930f4fdd, 0xc7231ccb, 0xe627f613, 0xaca7c8f1, 0x3e65d141, 0x79103ebb, 0x96df302b, 0x4d10f22d, 0x86b88ba5, 0xc53c3137, 0x3856bacc, 0x4c853583, 0x49466f6c, 0x07209c2f, 0x95bdf638, 0x11ddbeef, 0xb3b85bcc, 0x66e5b797, 0};


/*
Non-Optimized
It saves all the arguments to the stack which we don't do in codgen.
It also uses the numbers instead of the register names. It also uses much more instructions than we do. 
It also has a nop instruction after all the Load Words. It also seems to make more room on the stack then it uses.

Optimized
-O1
It removes most of the unnecessary nops if able to do so.
It will cut down on repeating code.

-O2
It jumps a lot in the code.
It does the same as -O1 but does not add more lines to make it faster.


-O3
It eliminate more nops. The program makes more lines of code,
only to use some of it only once. All this to eliminate many jumps which take time.

*/


/*
Lab 2 takes 15114 cycles.
Lab 4 -O0 takes 55383 cycles.
Lab 4 -O1 takes 13857 cycles.
Lab 4 -O2 takes 13430 cycles.
Lab 4 -O3 takes 13136 cycles.




*/

int codgen( int *seed_addr){		
	int n;
	unsigned int x, y;

	n = (*seed_addr >> 25) & 0x0000001f;  		// n = seed <29:25>

	while (n >= 0){
		x = (*seed_addr << 1);      		// x = seed left shift 1
		y = (*seed_addr / (unsigned int)128); 	// y = seed / unsigned 128

		*seed_addr = x ^ y; 			// seed = x XOR y
		n--; 					// n = n -1		
	}

	return (*seed_addr ^ 0x49d38788);		// return seed XOR 0x49d38788
}

int decode( int *wordarr, char *bytarr, int *seed_addr){
	unsigned int m, r, x, y;

	x = ~(codgen(seed_addr));			// x = One's complement of codgen (not)

	if (*wordarr == 0){				// If word at wordarr = 0
		*bytarr = 0;				// Then byte at bytarr = 0 and r = x
		r = x;
	} else {
		y = decode(wordarr + 1, bytarr + 1, seed_addr);	// y = decode(succ of wordarr and bytarr)
		m = (x ^ y) - *wordarr;			// m = (x XOR y) - word at wordarr
		*bytarr = (m >> 11) & 0x0ff;		// byte at bytarr = m <18:11>
		r = (~codgen(seed_addr)) + 1;		// r = two's complemnt of codgen (not + 1)
		r = x + y + m + r + 5;			
	}

	return r;
}

int main(){
	int seed = 0x20c99db1;				// Intialize seed

	decode(coded, plain, &seed); 			// Call decode to decode our coded words and store them in plain

	while(1);					// Infinite loop to make sure it works in syncsim
	return 0;
}

