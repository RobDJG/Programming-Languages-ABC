fun get_nth (los, index) =
    let
	fun list_traverse (losi, count) =
	    case losi of
		[] => ""
	      | y :: ys =>
		if count = index
		then y
		else list_traverse(ys, count + 1)
    in
	list_traverse(los, 1)
    end;

fun get_nth_integer (los, index) =
    let
	fun list_traverse (losi, count) =
	    case losi of
		[] => 0
	      | y :: ys =>
		if count = index
		then y
		else list_traverse(ys, count + 1)
    in
	list_traverse(los, 1)
    end;


fun date_to_string (year, month, day) =
    let
	val lom = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
	val formatted = get_nth(lom , month) ^ " " ^
			Int.toString (day) ^ ", " ^
			Int.toString (year)
				     
    in
	formatted
    end;



fun is_older ((y1, m1, d1), (y2, m2, d2)) =
    let
	val days_list = [
	    31, (* January *)
	    28, (* February, ignoring leap years *)
	    31, (* March *)
	    30, (* April *)
	    31, (* May *)
	    30, (* June *)
	    31, (* July *)
	    31, (* August *)
	    30, (* September *)
	    31, (* October *)
	    30, (* November *)
	    31  (* December *)
	];

	fun date_to_days (y, m, d) =
	    (y * 365) + (get_nth_integer(days_list,m)* m) + d
					 
	val date1 = date_to_days(y1, m1, d1);
	val date2 = date_to_days(y2, m2, d2)
    in
	if date1 < date2
	then true
	else false
    end;
								     

fun number_in_month (lod, month) =
    case lod of
	[] => 0
      | (y, m, d)::xs =>
	if m = month
	then 1 + number_in_month(xs, month)
	else number_in_month(xs,month)
			    
    
fun number_in_months (lod, lom) =
    case lom of
	[] => 0
      | x::xs =>
	number_in_month(lod, x) + number_in_months(lod, xs);
		
	
fun dates_in_month (lod, target_month) =
    case lod of
	[] => []
      | (year, date_month, day)::tl =>
	if date_month = target_month
	then (year, date_month, day) :: dates_in_month(tl, target_month)
	else dates_in_month(tl, target_month)

			   
fun dates_in_months (lod, lom) =
    case lom of
	[] => []
      | x :: xs =>
	dates_in_month(lod, x) @ dates_in_months(lod, xs);

	
    




fun number_before_reaching_sum (sum, lon) =
    let
	fun list_traverse(loni, count, add) =
	    case loni of
		[] => count
	      | x :: xs =>
		if (add + x) >= sum
		then count
		else list_traverse(xs, count + 1, add + x)
    in
	list_traverse(lon, 0, 0)
    end;


    
							
fun oldest (lod) =
    case lod of
	[] => NONE
      | x::xs =>
	let
	    fun date_extractor (SOME (y, m, d)) =
		(y, m, d)
	    
	    fun list_traverse (list) =
		case list of
		    head :: [] => SOME head
		  | head :: tail =>
		    let
			val tail_date = date_extractor(list_traverse tail)
		    in
			if is_older(head, tail_date)
			then SOME head
			else SOME tail_date
		    end;
	in
	    list_traverse lod
	end;		
			    
	
