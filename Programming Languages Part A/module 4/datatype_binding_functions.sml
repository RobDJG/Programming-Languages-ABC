(* Module 4: Another Expression Example *)

datatype exp =
	 Constant of int
	 | Negate of exp
	 | Add of exp * exp
	 | Multiply of exp * exp

(* Note: example as explained in video assumes there is no library
function for max of two ints. There is: Int.max  *)


	     
	

				 
fun max_constant expression =
    let
	fun is_greater (e1, e2) =
	    Int.max(max_constant e1, max_constant e2)
		
    in
    case expression of
	Constant i => i
      | Negate e2 => max_constant e2
      | Add(e1, e2) => is_greater(e1, e2)
      | Multiply(e1, e2) => is_greater(e1, e2) 
												     
    end
	
				       
		  												  
val test_exp = Add (Constant 19, Negate (Constant 4))
val test_exp_2 = Add (Constant 19, Multiply(Constant 5, Constant 25))
		   
		   
val nineteen = max_constant test_exp;
val twentyfive = max_constant test_exp_2;

