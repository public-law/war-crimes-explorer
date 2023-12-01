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
criminal_liability(genocide, Accused, Group) :-
	article_6_group(Group),
	elements(genocide, Accused, Group).

article_6_group(Group) :- national_group(Group).
article_6_group(Group) :- ethnic_group(Group).
article_6_group(Group) :- racial_group(Group).
article_6_group(Group) :- religious_group(Group).

elements(genocide, Accused, Group) :-
	genocidal_intent(Accused, Group),
	genocidal_act(Accused, Group).

genocidal_act(Accused, Group) :- act(Accused, killed_members, Group).
genocidal_act(Accused, Group) :- act(Accused, caused_serious_bodily_harm_to_members, Group).
genocidal_act(Accused, Group) :- act(Accused, deliberately_inflicted_on_members, Group).
genocidal_act(Accused, Group) :- act(Accused, imposed_on_members, Group).
genocidal_act(Accused, Group) :- act(Accused, forcibly_transferred_children_of_members, Group).


/*
 * Test data 
 * 
 * Normally, this would be provided by the user via a web interface
 * or dialog with a chatbot.
 */

/* Sudanese ethnic groups */
ethnic_group(beja).
ethnic_group(berti).
ethnic_group(dajo).
ethnic_group(fallata).
ethnic_group(fur).
ethnic_group(gimir).
ethnic_group(ingessana).
ethnic_group(jur).
ethnic_group(masalit).
ethnic_group(nuba).
ethnic_group(tunjur).
ethnic_group(uduk).
ethnic_group(zaghawa).

/* Sudan has the intent to eliminate these groups */
genocidal_intent(sudan, fur).
genocidal_intent(sudan, masalit).
genocidal_intent(sudan, zaghawa).

/* The actual bad acts that were committed */
act(sudan, killed_members, fur).
act(sudan, caused_serious_bodily_harm, fur).
act(sudan, killed_members, masalit).
act(sudan, killed_members, zaghawa).
act(sudan, killed_members, jur).
