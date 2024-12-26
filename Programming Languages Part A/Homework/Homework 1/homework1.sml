fun is_older (d1 : (int * int * int), d2 : (int * int * int)) =
    if (#1 d1) + (#2 d1) + (#3 d1) < (#1 d2) + (#2 d2) + (#3 d2)
    then true
    else false;

fun number_in_month (dl : (int * int * int) list, month : int) =
    let
	fun month_count (lst: (int * int * int) list, count: int) =
	    case lst of
		[] => count
	      | x :: xl =>
		if (#2 x) = month (* Check if the month in the list element  is equal to the month argument *)
		then month_count(xl, count + 1)
		else month_count(xl, count)
    in
	month_count(dl, 0) (* Starting the count at 0 *)
    end;


	    
    
	
