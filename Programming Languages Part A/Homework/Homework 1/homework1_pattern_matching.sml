
fun is_older ((y1, m1, d1), (y2, m2, d2)) =
    if (y1 + m1 + d1) < (y2 + m2 +d2)
    then true
    else false;

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
	    

fun date_to_string (year, month, day) =
    let
	val lom = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
	val formatted = get_nth(lom , month) ^ " " ^
			Int.toString (day) ^ ", " ^
			Int.toString (year)
										 		
    in
	formatted
    end;
