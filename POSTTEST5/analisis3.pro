DOMAINS	
	orang = orang(nama,alamat)			%dalam parameter orang terdapat objek nama, dan alamat
	nama = nama(pertama,kedua)			%dalam parameter nama terdapat objek pertama, dan kedua
	alamat = alamat(jalan,kota_kab,propinsi)	%dalam parameter alamat terdapat objek jalan,kota_kab,propinsi
	jalan = jalan(nama_jalan,nomor)			%dalam parameter jalan tersapat objek nama_jalan,nomor
	kota_kab,propinsi,nama_jalan = string		%kota_kab,propinsi,nama_jalan menggunakan tipe data string
	pertama,kedua = symbol				%dalam parameter pertama dan kedua memiliki tipe data symbol
	nomor = integer					%parameter nomor menggunakan tipe data integer
GOAL		
	P1 = orang(nama(diena,fatihah), alamat(jalan("Wijaya Kusuma", 12), "Berbah", "DIY")),	%Data pertama yang berisi data lengkap yang sudah di isi
	P1 = orang(nama(_,fatihah),Alamat),		%P1 akan memunculkan Data P1 yang berisi data Wijaya
	P2 = orang(nama(nur,fatihah),Alamat),		%P2 akan memunculkan Data P1 yang pertama kali dimunculkan
	write("P1=",P1),nl,				%Data P1 yang pertama kali dijalankan akan bernilai sama dengan P1 pertama yang lengkap
	write("P2=",P2),nl.				%Data P2 akan bernilai sama dengan P2 yang lengkap

