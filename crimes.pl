/*
 * Genocide
 * https://world.public.law/rome_statute/article_6_genocide
 */
criminal_liability(genocide, Accused, Group) :-
	genocidal_intent(Accused, Group),
	article_6_group(Group),
	genocidal_act(Accused, Group).

article_6_group(Group) :- national_group(Group).
article_6_group(Group) :- ethnic_group(Group).
article_6_group(Group) :- racial_group(Group).
article_6_group(Group) :- religious_group(Group).

genocidal_act(Accused, Group) :- act(Accused, killed, Group).
genocidal_act(Accused, Group) :- act(Accused, caused_serious_bodily_harm, Group).
genocidal_act(Accused, Group) :- act(Accused, deliberately_inflicted_conditions, Group).
genocidal_act(Accused, Group) :- act(Accused, imposed_measures_to_prevent_births, Group).
genocidal_act(Accused, Group) :- act(Accused, forcibly_transferred_children, Group).


/*
 * Test data 
 * 
 * Normally, this would be provided by the user via a web interface
 * or dialog with a chatbot.
 */

/* Acts that were committed */
act(sudan, killed, beja).
act(sudan, killed, fur).
act(sudan, killed, masalit).
act(sudan, killed, nuba).
act(sudan, killed, christian).
act(sudan, killed, zaghawa).
act(sudan, caused_serious_bodily_harm, fur).
act(sudan, encouraged_to_temporarily_relocate, dajo).
act(sudan, encouraged_to_temporarily_relocate, fur).
act(sudan, encouraged_to_temporarily_relocate, uduk).
act(sudan, encouraged_to_temporarily_relocate, arab).

/* Sudanese groups */
ethnic_group(arab).
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

religious_group(sunni_muslim).
religious_group(christian).

/* Sudan has/had the goal of destroying these groups, i.e., ethnic cleansing. */
genocidal_intent(sudan, fallata).
genocidal_intent(sudan, fur).
genocidal_intent(sudan, jur).
genocidal_intent(sudan, masalit).
genocidal_intent(sudan, nuba).
genocidal_intent(sudan, tunjur).
genocidal_intent(sudan, zaghawa).


/*
 * Configuration
 */
:- dynamic genocidal_intent/2.

:- dynamic national_group/1.
:- dynamic ethnic_group/1.
:- dynamic racial_group/1.
:- dynamic religious_group/1.

:- dynamic act/3.
