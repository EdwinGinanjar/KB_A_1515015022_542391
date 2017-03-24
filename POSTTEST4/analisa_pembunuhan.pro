DOMAINS
nama,jender,pekerjaan,benda,alasan,zat = symbol
umur=integer

PREDICATES
nondeterm orang(nama, umur, jender, pekerjaan)
nondeterm selingkuh(nama, nama)
terbunuh_dengan(nama, benda)
terbunuh(nama)
nondeterm pembunuh(nama)
motif(alasan)
ternodai(nama, zat)
milik(nama, benda)
nondeterm cara_kerja_mirip(benda, benda)
nondeterm kemungkinan_milik(nama, benda)
nondeterm dicurigai(nama)

/* * * Fakta-fakta tentang pembunuhan * * */
CLAUSES
orang(budi,55,m,tukang_kayu).
orang(aldi,25,m,pemain_sepak_bola).
orang(aldi,25,m,tukang_jagal).
orang(joni,25,m,pencopet).
selingkuh(ina,joni).
selingkuh(ina,budi).
selingkuh(siti,joni).
terbunuh_dengan(siti,pentungan).
terbunuh(siti).
motif(uang).
motif(cemburu).
motif(dendam).
ternodai(budi, darah).
ternodai(siti, darah).
ternodai(aldi, lumpur).
ternodai(joni, coklat).
ternodai(ina, coklat).
milik(budi,kaki_palsu).
milik(joni,pistol).
/* * * Basis Pengetahuan * * */
cara_kerja_mirip(kaki_palsu, pentungan).
cara_kerja_mirip(balok, pentungan).
cara_kerja_mirip(gunting, pisau).
cara_kerja_mirip(sepatu_bola, pentungan).
kemungkinan_milik(X,sepatu_bola):-
orang(X,_,_,pemain_sepak_bola).
kemungkinan_milik(X,gunting):-
orang(X,_,_,pekerja_salon).
kemungkinan_milik(X,Benda):-
milik(X,Benda).
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * *
* dicurigai semua orang yang memiliki senjata yang *
* kerjanya mirip dengan senjata penyebab siti terbunuh. *
* * * * * * * * * * * * * * * * * * * * * * * * * * * * */
dicurigai(X):-
terbunuh_dengan(siti,Senjata) ,
cara_kerja_mirip(Benda,Senjata) ,
kemungkinan_milik(X,Benda).
/* * * * * * * * * * * * * * * * * * * * * * * * * *
* dicurigai laki-laki yang selingkuh dengan siti. *
* * * * * * * * * * * * * * * * * * * * * * * * * */
dicurigai(X):-
motif(cemburu),
orang(X,_,m,_),
selingkuh(siti,X).
/* * * * * * * * * * * * * * * * * * * * * * *
* dicurigai perempuan yang selingkuh dengan *
* laki-laki yang juga selingkuh dengan siti *
* * * * * * * * * * * * * * * * * * * * * * */
dicurigai(X):-
motif(cemburu),
orang(X,_,f,_),
selingkuh(X,Lakilaki),
selingkuh(siti,Lakilaki).
/* * * * * * * * * * * * * * * * * * * * * * * * * * *
* dicurigai pencopet yang mempunyai motif uang. *
* * * * * * * * * * * * * * * * * * * * * * * * * * */
dicurigai(X):-
motif(uang),
orang(X,_,_,pencopet).
pembunuh(Pembunuh):-
orang(Pembunuh,_,_,_),
terbunuh(Terbunuh),
Terbunuh <> Pembunuh, /* Bukan bunuh diri */
dicurigai(Pembunuh),
ternodai(Pembunuh,Zat),
ternodai(Terbunuh,Zat).
GOAL
pembunuh(X).

%dari goal yang ingin dicari adalah siapa pembunuh dengan X adalah variable yang akan dicari. Program pada awalnya
%akan melakukan proses di clauses untuk melacak data-data yang telah dideklarasikan pada section clauses yang di dalamnya
%ada data yang terlibat dalam kasus pembunuhan. Dari fakta yang ada argumen X merupakan argumen pembunuh. Dan dari argumen 
%pembunuh, program akan mencari fakta orang yang mengetahui pembunuh tersebut. pernyataan pertama adalah budi. Selanjutnya 
%program akan mencari pernyataan terbunuh, maka di temukan faktanya adalah siti. Dan program melakukan pencarian pada 
%pernyataan dicurigai dan kemudian program akan mencari senjata yang di pakai intuk membunuh, dengan proses di variable terbunuh_dengan.
%dan fakta yang didapat adalah terbunuh_dengan(siti, pentungan). Setelah itu program mencari fakta benda yang cara kerjanya
%seperti senjata, dan diperoleh cara_kerja_mirip(Benda, Senjata). Kemudian program akan memanggil pernyataan tersebut untuk 
%mengetahui benda yang cara kerjanya mirip pentungan, maka diperoleh cara_kerja_mirip(kaki_palsu, pentungan. dan program akan
%memproses fakta dari variable kemungkinan_milik(X.Benda), milik(X,Benda). dan dari pernyataan itu maka program mencari siapa pemilik
%kaki palsu, dan hasilnya adalah milik budi di buktikan dengan fakta milik(budi,kaki_palsu). kemudian program masih harus memproses pernyataan
%ternodai(Pembunuh,Zat). dan diproses dengan pernyataan yang mengandung nama budi, maka di didapat ternodai(budi,dara). Selanjutnya 
%program akan melakukan proses terakhir pada ternodai(Terbunuh,Zat). maka di dapat hasil ternodai(siti,darah). dari fakta-fakta tersebut
%maka di dapat kesimpulan siti yang memiliki noda darah sama persis dengan budi yang juga memiliki noda darah. maka pelaku pembunuhnya
%tidak lain dan tidak bukan adalah budi.
