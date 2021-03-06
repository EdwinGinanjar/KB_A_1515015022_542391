%Analisis by Edwin Ginanjar Firdaus / 1515015022


PREDICATES			  %dalam predicates merupakan fungsi untuk memberikan gambaran fakta yang ada di fungsi CLAUSA dan berikut beberapa pernyataan yang ada dalam PREDICATES :
putra(STRING,STRING)   		  %pernyataan atau fakta terhadap putra yang memiliki tipe nilai string
saudara_perempuan(STRING,STRING)  %pernyataan saudara_perempuan memiliki tipe fungsi string 
saudara_laki(STRING,STRING)	  %pernyataan saudara_laki memiliki nilai string
menikah(STRING,STRING)		  %pernyataan menikah memiliki nilai string
ayah(STRING ayah,STRING putra)	  %pernyataan dimana ayah mempunyai 2 nilai yang sama yaitu ayah dan putra masing-masing mempunyai nilai string
kakek(STRING kakek,STRING cucu)	  %%pernyataan dimana kakek mempunyai 2 nilai yang sama yaitu kakek dan cucu masing-masing mempunyai nilai string
nondeterm ipar_perempuan(STRING,STRING)%dalam pernyataan ini fungsi nondeterm bersifat general dimana suatu predikat memiliki lebih dari satu jawaban atau solusi dan ipar_perempuan memiliki nilai string
CLAUSES				  %fungsi clausa merupakan fungsi untuk memberikan fakta-fakta yang ada
putra("Ikhsan","Bentang").	  %dalam bahasa natural dibaca ikhsan putra dari Bentang
saudara_perempuan("Dini","Dina"). %dalam bahasa natural dibaca Dini saudara perempuan dari Dina
saudara_laki("Adi","Lintang").    %dalam bahasa natural dibaca Adi Saudara laki dari Lintang
menikah("Ikhsan","Dini").	  %dalam bahasa natural dibaca Ikhsan menikah dengan Dini
menikah("Lintang","Surga").	  %dalam bahasa natural dibaca Lintang menikah dengan Surga
ayah(A,B):-putra(B,A).		  %deklarasi disamping menyatakan A adalah ayah dari B jika B adalah putra dari A 
kakek(A,B):-ayah(A,C), ayah(C,B). %di artikan menjadi A kakek dari B jika A adalah ayah dari C dan C adalah ayah dari B, sehingga ruas kanan adalah penjabaran dari ruas kiri
ipar_perempuan(A,B):-menikah(A,C), saudara_perempuan(C,B). %dapat dibaca A adalah ipar perempuan dari B jika A menikah dengan C dan C adalah saudara perempuan dari B
ipar_perempuan(A,B):-saudara_laki(A,C), menikah(C,B). %dapat dibaca A adalah saudara laki dari B jika A adalah saudara laki dari C dan C menikah dengan B
GOAL
ipar_perempuan("Ikhsan",X). 
%pada goal terdapat pernyataan ipar_perempuan("Ikhsan",X) dimana pernyataan itu dibaca Ikhsan mempunyai ipar perempuan X dimana X adalah statement penggati untuk 
%mencari jawaban dari siapa saudara perempuan dari Ikhsan
%dan hasil dari X jika di jalankan akan memberikan solusi berupa X=Dina karena dalam pernyataan di sebutkan ipar_perempuan(A,B):-menikah(A,C), saudara_perempuan(C,B). yang berarti :
%A adalah ipar perempuan dari B dimana A kita asumsikan sebagai Ikhsan dan B sementara adalah X jika A menikah dengan C disini ternyata Ikhsan(A) menikah dengan C dimana C adalah Dini yang
%didapat dari pernyataan sebelumnya yaitu : menikah("Ikhsan","Dini"). ikhsan menikah dengan Dini dan Dini(C) adalah saudara perempuan dari B yang berarti saudara perempuan dari Dini adalah Dina
%jadi dapat di ambil jawaban bahwa Ikhsan memiliki saudara perempuan yaitu Dina.