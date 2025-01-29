
(*Self reference data types*)

datatype exp = Constant of int
	     | Negate of exp
	     | Add of exp * exp
	     | Multiply of exp * exp


fun eval expression =
    case expression of
	Constant i => i
      | Negate i => ~ (eval i)
      | Add(e1, e2) => (eval e1) + (eval e2)
      | Multiply(e1, e2) => (eval e1) * (eval e2)

					    
fun number_of_adds expression =
    case expression of
	Constant i => 0
      | Negate i => number_of_adds i
      | Add(e1, e2) => 1 +  number_of_adds e1 + number_of_adds e2
      | Multiply(e1, e2) => number_of_adds e1 + number_of_adds e2;


val example_exp_1 = Add(Multiply(Add(Constant 10, Constant 15), Constant 10), Constant 50);

val example_exp_1_ans = eval example_exp_1;

val example_exp_1_addCount = number_of_adds example_exp_1;



