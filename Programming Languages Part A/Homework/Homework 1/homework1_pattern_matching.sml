
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
    case lod of
	[] => 0
       |(y, m, d)::tl  =>
	
