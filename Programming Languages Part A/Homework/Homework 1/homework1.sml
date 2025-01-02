fun is_older (d1 : (int * int * int), d2 : (int * int * int)) =
    if (#1 d1) + (#2 d1) + (#3 d1) < (#1 d2) + (#2 d2) + (#3 d2)
    then true
    else false;

fun number_in_month (dl : (int * int * int) list, month : int) =
    let
	fun month_count (lst: (int * int * int) list, count: int) =
	    if null lst
	    then count
	    else
		if (#2 (hd lst)) = month
		then month_count(tl lst, count +1)
		else month_count(tl lst, count)
				
    in
	month_count(dl, 0)
    end;



fun number_in_months (lod : (int * int * int) list, lom : int list) =
    let
        fun month_count (lst : (int * int * int) list, count : int) =
            if null lst then count
            else
                let
                    fun month_list_traverse (month : int, lomi : int list) =
                        if null lomi then false
                        else (hd lomi = month) orelse month_list_traverse (month, tl lomi)
                in
                    if month_list_traverse (#2 (hd lst), lom)
                    then month_count (tl lst, count + 1)
                    else month_count (tl lst, count)
                end
    in
        month_count (lod, 0)
    end;








				
				
			    
    
	
