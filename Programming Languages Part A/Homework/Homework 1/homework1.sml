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

				  
fun date_to_string(date : int * int * int) =
    let
	val lom = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
	val formatted = get_nth(lom , #2 date) ^ " " ^
			Int.toString (#3 date) ^ ", " ^
			Int.toString (#1 date)
										 		
    in
	formatted
    end;


fun number_before_reaching_sum(sum : int, loi : int list) =
    if null loi
    then 0
    else
	let
	    fun loi_traverse(loim : int list, count : int, total : int) =
		if total < sum
		then loi_traverse( tl loim, count + 1, total + hd (tl loim) )
		else
		    count

	in
	    loi_traverse(loi, 0, hd loi)
	end;


fun what_month(day : int) =
    let
	val loi = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
	val month = number_before_reaching_sum(day, loi)
    in
	if month = 12
	then 12
	else month + 1
			 
    end;


fun month_range (day1 : int, day2 : int) =
    if day1 > day2
    then []
    else
	what_month(day1)::month_range(day1 + 1, day2)

				     



    
    
    
    
    
	    




				
				
			    
    
	
