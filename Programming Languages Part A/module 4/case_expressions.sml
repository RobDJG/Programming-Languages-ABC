datatype mytype = TwoInts of int * int
		| Str of string
	|Pizza

fun f x =
    case x of
	Pizza => 1
      | Str s => 8
      | TwoInts(i1, i2) => i1 + i2

				    
	     
