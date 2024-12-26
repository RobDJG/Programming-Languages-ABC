
fun swap (pr : int*bool) =
    (#2 pr, #1 pr);

fun sum_two_pairs (pr1 : int * int, pr2: int * int) =
    (#1 pr1) + (#2 pr1) + (#1 pr2) + (#2 pr2);

fun div_mod (x : int, y : int) =
    (x div y, x mod y);

fun sort_pair(pr : int * int) =
    if (#1 pr) > (#2 pr)
    then (#2 pr,  #1 pr)
    else pr;

val pair_1 = (1, 5);
val pair_2 = (3, 7);
val pair_3 = (5, true);
val pair_4 = (2, 1);

swap pair_3;
sum_two_pairs (pair_1 ,pair_2);
sort_pair pair_4;

		 
		 
