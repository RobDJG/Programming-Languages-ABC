(* Dan Grossman, Coursera PL, HW2 Provided Code *)

(* if you use this function to compare two strings (returns true if the same
   string), then you avoid several of the functions in problem 1 having
   polymorphic types that may be confusing *)
fun same_string(s1 : string, s2 : string) =
    s1 = s2

(* put your solutions for problem 1 here *)


fun all_except_option (str, los) =
    case los of
	[] => NONE
       |x::los'  => if same_string(str,x)
		    then SOME los'
		    else
			case all_except_option(str, los') of
			    NONE => NONE
			   |SOME y  => SOME (x :: y)

					    
fun get_substitutions1 (llos,str) =
    case llos of
	[] => []
      | x :: xs' =>
	case all_except_option(str, x) of
	    NONE => get_substitutions1(xs', str)
	  | SOME y => y @ get_substitutions1(xs', str)

fun get_substitutions2 (llos,str) =
    case llos of
	[] => []
      | x :: xs' =>
	let fun aux (llos, acc) =
		case all_except_option(str, x) of
		    NONE => aux(xs', acc)
		  | SOME y =>  aux(xs', y @ acc)
	in
	    aux(llos, [])
	end
	    
					    
val answer1 =get_substitutions2([["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]], "Fred");
(* answer: ["Fredrick","Freddie","F"] *)
val answer2 = get_substitutions1([["Fred","Fredrick"],["Jeff","Jeffrey"],["Geoff","Jeff","Jeffrey"]], "Jeff");
(* answer: ["Jeffrey","Geoff","Jeffrey"] *)

					    

					    
						   
	    

(* you may assume that Num is always used with values 2, 3, ..., 10
   though it will not really come up *)
datatype suit = Clubs | Diamonds | Hearts | Spades
datatype rank = Jack | Queen | King | Ace | Num of int 
type card = suit * rank

datatype color = Red | Black
datatype move = Discard of card | Draw 

exception IllegalMove

(* put your solutions for problem 2 here *)
