/*
 * Configuration
 */
:- dynamic genocidal_intent/2.

:- dynamic national_group/1.
:- dynamic ethnic_group/1.
:- dynamic racial_group/1.
:- dynamic religious_group/1.

:- dynamic act/3.


/*
 * Genocide
 * https://world.public.law/rome_statute/article_6_genocide
 */
criminal_liability(genocide, D, G) :-
	group(G),
	elements(genocide, D, G).

group(G) :- national_group(G).
group(G) :- ethnic_group(G).
group(G) :- racial_group(G).
group(G) :- religious_group(G).

elements(genocide, D, G) :-
	genocidal_intent(D, G),
	genocidal_act(D, G).

genocidal_act(D, G) :- act(D, killed_members, G).
genocidal_act(D, G) :- act(D, caused_serious_bodily_harm_to_members, G).
genocidal_act(D, G) :- act(D, deliberately_inflicted_on_members, G).
genocidal_act(D, G) :- act(D, imposed_on_members, G).
genocidal_act(D, G) :- act(D, forcibly_transferred_children_of_members, G).


/*
 * Test data 
 * 
 * Normally, this would be provided by the user via a web interface
 * or dialog with a chatbot.
 */

/* Describe ethnic groups */
ethnic_group(fur).
ethnic_group(masalit).
ethnic_group(zaghawa).
ethnic_group(jur).

/* Sudan has the intent to eliminate these groups */
genocidal_intent(sudan, fur).
genocidal_intent(sudan, masalit).
genocidal_intent(sudan, zaghawa).

/* Sudan has killed members of these groups */
act(sudan, killed_members, fur).
act(sudan, killed_members, masalit).
act(sudan, killed_members, zaghawa).
act(sudan, killed_members, jur).
