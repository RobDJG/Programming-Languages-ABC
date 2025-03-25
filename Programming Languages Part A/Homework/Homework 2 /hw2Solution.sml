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
					    
					    
fun get_substitutions2 (llos, str) =
    let
	fun aux ([], acc) = acc
         | aux (x::xs, acc) =
           case all_except_option(str, x) of
                 NONE => aux(xs, acc)
               | SOME y => aux(xs, acc @ y)
    in
	aux(llos, [])
    end

fun similar_names (llos, {first, middle, last}) =
    case llos of
	[] => []
      | x::xs =>
	let					 
	    fun aux (losub) =
		case losub of
		    [] => []
		  | y::ys => {first = y,middle=middle ,last=last} :: aux ys
	in
	    {first = first,middle=middle ,last=last}::aux (get_substitutions1(llos, first))
	end
	    
	

	

					    
						   
	    

(* you may assume that Num is always used with values 2, 3, ..., 10
   though it will not really come up *)
datatype suit = Clubs | Diamonds | Hearts | Spades
datatype rank = Jack | Queen | King | Ace | Num of int 
type card = suit * rank

datatype color = Red | Black
datatype move = Discard of card | Draw 

exception IllegalMove

(* put your solutions for problem 2 here *)

fun card_color (suit, rank) =
    case suit of
	(Spades | Clubs) => Black
      | (Hearts | Diamonds) => Red
		      
fun card_value (suit, rank) =
    case rank of
	Num i => i
      | Ace =>  11
      | _ => 10

fun remove_card (loc, card, except) =
    case loc of
	[] => raise except
      | x::xs =>
	if x = card
	then xs
	else x :: remove_card(xs, card, except)

fun all_same_color (loc) =
    case loc of
	[] => true
      | head :: [] => true
      | head::(neck::rest) =>
	(card_color(head) = card_color(neck)
	 andalso all_same_color (neck ::rest))
			     
fun sum_cards (loc) =
    let
	fun aux(n, acc) =
	    case n of
		[] => acc
	      | x::xs =>
		aux(xs, card_value(x) + acc)
    in
	aux(loc, 0)
    end
	

fun score (loc, goal) =
    let
	val sum = sum_cards (loc)

	fun preliminary_score (n) =
	    if n > goal
	    then 3 * (n - goal)
	    else (goal - n)
    in
	if all_same_color(loc)
	then preliminary_score(sum) div 2
	else preliminary_score(sum)
    end
	
	    
		 
