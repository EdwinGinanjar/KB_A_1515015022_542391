DOMAINS
	benda = buku(judul, pengarang) ;	
	kuda(nama) ; 			
		kapal ;				
		bukubank(saldo)			
	judul, pengarang, nama = symbol		%dalam parameter judul, pengarang, dan nama menggunakan tipe data symbol
	saldo = real				%dalam parameter saldo menggunakan type data real
	
PREDICATES	
	nondeterm milik(nama,benda)	
	
CLAUSES
	milik(erwin, buku("Markesot Bertutur", "Emha Ainun Najib")).	
	milik(erwin, kuda(buraq)). 					
	milik(erwin, kapal). 						
	milik(erwin, bukubank(1000)). 					
GOAL		
	milik(erwin, Benda). /*pada goal yang dicari akan mencari benda yang dimiliki erwin dan sesuai dengan fakta dalam klausa bahwa erwin memiliki benda berupa buku, kuda(buraq), kapal, dan bukubank/*

