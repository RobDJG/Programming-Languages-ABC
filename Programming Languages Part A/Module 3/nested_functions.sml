fun count (from : int, to : int) =
    if from=to
    then to :: []
    else from :: count(from + 1, to);

fun countup_from1 (x : int) =
    count(1, x);

(*Using count as a helper private function*)
fun countup_from1_v2 (x : int) =
    let
	fun count (from : int, to : int) =
            if from=to
            then to :: []
            else from :: count(from + 1, to);
    in
	count(1, x)
	     
    end


fun countup_from1_v3 (x : int) =
    let
	fun count (from : int) =
            if from = x
            then x :: []
            else from :: count(from + 1);
    in
	count(1)
	     
    end

