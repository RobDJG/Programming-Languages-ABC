use "homework2.sml";

val test1_get_substitutions1 = get_substitutions1(
	[["Fred","Fredrick"], ["Elizabeth","Betty"], ["Freddie","Fred","F"]],
	"Fred"
    ) = ["Fredrick","Freddie","F"];

val test2_get_substitutions1 = get_substitutions1(
	[["Fred","Fredrick"], ["Jeff","Jeffrey"], ["Geoff","Jeff","Jeffrey"]],
	"Jeff"
    ) = ["Jeffrey","Geoff","Jeffrey"];

val test_get_substitutions1 = get_substitutions1(
	[["April","June"], ["May","July"], ["September","October"]],
	"Fred"
    ) = [];


val test1_get_substitutions2 = get_substitutions2(
	[["Fred","Fredrick"], ["Elizabeth","Betty"], ["Freddie","Fred","F"]],
	"Fred"
    ) = ["Fredrick","Freddie","F"];

val test2_get_substitutions2 = get_substitutions2(
	[["Fred","Fredrick"], ["Jeff","Jeffrey"], ["Geoff","Jeff","Jeffrey"]],
	"Jeff"
    ) = ["Jeffrey","Geoff","Jeffrey"];

val test_get_substitutions2 = get_substitutions2(
	[["April","June"], ["May","July"], ["September","October"]],
	"Fred"
    ) = [];
