
fun sum_list(xs : int list) =
    if null xs
    then 0
    else
	hd xs + sum_list (tl xs);

fun mul_list(xs : int list) =
    if null xs
    then 1
    else
	hd xs * mul_list (tl xs);

fun countdown (x : int) =
    if x = 0
    then []
    else
	x :: countdown(x - 1);

fun append (xs : int list, ys : int list) =
    if null xs
    then ys
    else
	(hd xs) :: append ((tl xs), ys);

(* functions over pairs of lists *)
    
fun sum_pair_list (xs: (int * int) list) =
    if null xs
    then 0
    else
	#1 (hd xs) + #2 (hd xs) + sum_pair_list(tl xs);


fun firsts (xs: (int * int) list) =
    if null xs
    then []
    else
	#1 (hd xs) :: firsts(tl xs);

fun seconds (xs: (int * int) list) =
    if null xs
    then []
    else
	#2 (hd xs) :: seconds(tl xs);

fun sum_pair_list2 (xs : (int * int) list) =
    (sum_list (firsts xs)) + (sum_list (seconds xs));

fun factorial (n : int) =
    mul_list (countdown n);


    
					       

						    
						   

	

val lst = [1, 2, 3];
val lst2 = [3, 5, 6];

val lst3 = [(1, 5), (3, 4)]



