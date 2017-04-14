/*****************************************************************************

		Copyright (c) 1984 - 2000 Prolog Development Center A/S

 Project:  
 FileName: CH07E03.PRO
 Purpose: 
 Written by: PDC
 Modifyed by: Eugene Akimov
 Comments: 
******************************************************************************/

domains
  list = integer* /* or whatever type you want to use */ %pendeklarasian list dengan tipe data integer

predicates
  length_of(list,integer,integer) - procedure (i,o,i) %pendeklarasian predikat length_of dengan parameter list(input), integer(output), dan list(input)

clauses
  length_of([], Result, Result). %bila leng_of bernilai kosong maka variable result pertama akan bernilai sama dengan result yang ke dua
  length_of([_|T],Result,Counter):- %inputan counter berfungsi untuk nilai yang di inputkan  
	NewCounter = Counter + 1, %akan ditambahkan dengan 1 untuk mendapatkan panjang list
	length_of(T, Result, NewCounter).

goal
  length_of([1,2,3],L,0). /* start with Counter = 0 */  /*mencari panjang list dengan nilai counter = 0 dimana head bernilai 1 dan tailnya 2 dan 2 (ada 2 tail)
    			counter = 0 maka newcounter = counter + 1 -> 0 + 1 = 1
    			length_of = tail + counter 
    				  =  2   +   1
    				  =  3
    				  
    			maka di dapatkan hasil goal dari panjang list = 3*/