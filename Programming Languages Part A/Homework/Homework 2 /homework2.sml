(* Dan Grossman, Coursera PL, HW2 Provided Code *)

(* if you use this function to compare two strings (returns true if the same
   string), then you avoid several of the functions in problem 1 having
   polymorphic types that may be confusing *)
fun same_string(s1 : string, s2 : string) =
    s1 = s2

(* put your solutions for problem 1 here *)

(* Return NONE if str not found in the list, but if found,
 return the list as an option but without str*)
	     
fun all_except_option (str, los) =
    case los of
	[] => NONE
      | head :: tail =>
	if same_string(str, head)
	then SOME tail
	else
	    case all_except_option(str, tail) of
		NONE => NONE
	       |SOME y  => SOME (head :: y)
					    

fun get_substitutions1 (str, llos) =
    case llos of
	[] => []
      | x :: xs =>
	case all_except_option(str, x) of
	    NONE => get_substitutions1(str, xs)
	  | SOME y => y @ get_substitutions1(str, xs)
						

					      
						   

					    
					   
	    
    

(* you may assume that Num is always used with values 2, 3, ..., 10
   though it will not really come up *)
datatype suit = Clubs | Diamonds | Hearts | Spades
datatype rank = Jack | Queen | King | Ace | Num of int 
type card = suit * rank

datatype color = Red | Black
datatype move = Discard of card | Draw 

exception IllegalMove

(* put your solutions for problem 2 here *)
