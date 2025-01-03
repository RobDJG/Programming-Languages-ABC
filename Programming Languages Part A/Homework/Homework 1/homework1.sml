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



fun dates_in_month(lod : (int * int * int) list, month : int) =
    if null lod
    then []
    else
	if #2 (hd lod) = month
	then  (hd lod) :: dates_in_month(tl lod, month)
	else  dates_in_month(tl lod, month);


fun dates_in_months(lod : (int * int * int) list, lom : int list) =
    if null lod
    then []
    else
	let
	    fun lom_traverse (date : (int * int * int), lomi: int list) =
		if null lomi
		then false
		else #2 date = hd lomi orelse lom_traverse(date , tl lomi)
	in
	    if lom_traverse(hd lod, lom)
	    then hd lod :: dates_in_months(tl lod, lom)
	    else dates_in_months(tl lod, lom)
	end;


fun get_nth(los : string list, index : int) =
    if null los
    then ""
    else
	let
	    fun list_traverse(losi : string list, count: int) =
		if index = count
		then (hd losi)
		else list_traverse(tl losi, count + 1)
	in
	   list_traverse(los, 1)
	end;

				  
		
    
    
    
    
    
	    




				
				
			    
    
	
