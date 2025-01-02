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


fun number_in_months (lod : (int * int * int) list, lom : int list) =
    let
	fun month_count (lst: (int * int * int) list, count: int) =
	    case lst of
		[] => count
	      | x :: xl =>
		let
		    fun month_list_traverse (month: int, lomi: int list) =
			if null lomi
			then month_count(xl, count)
			else
			    if (hd lomi) = (#2 x)
			    then month_count(xl, count + 1)
			    else month_list_traverse ((#2 x), (tl lomi))
		in
		    month_list_traverse((#2 x), lom)
		end;
    in
	month_count (lod, 0)
    end;
