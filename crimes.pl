/*
 * Crimes within the jurisdiction of the International Criminal Court.
 * 
 * https://world.public.law/rome_statute/article_5_crimes_within_the_jurisdiction_of_the_court
 */
crime(genocide).
crime(war_crime).
crime(crime_against_humanity).
crime(crime_of_aggression).


/*
 * Genocide
 * https://world.public.law/rome_statute/article_6_genocide
 */
criminal_liability(genocide, D, G) :-
	group(G),
	elements(genocide, D, G).

group(G) :- national_group(G).
group(G) :- ethnical_group(G).
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

/* Test data */
ethnical_group(fur).
ethnical_group(masalit).
ethnical_group(zaghawa).

genocidal_intent(sudan, fur).
genocidal_intent(sudan, masalit).
genocidal_intent(sudan, zaghawa).

act(sudan, killed_members, fur).
act(sudan, killed_members, masalit).
act(sudan, killed_members, zaghawa).


/*
 * War crimes
 * https://world.public.law/rome_statute/article_8_war_crimes
 */

/*
 * A first, simple attempt at Protected Persons under
 * the Geneva Conventions of 1949.
 */
% protected_by_geneva_convention(P) :- person(P), civilian(P).
% protected_by_geneva_convention(P) :- person(P), prisoner_of_war(P).
% protected_by_geneva_convention(P) :- person(P), medical_personnel(P).
% protected_by_geneva_convention(P) :- person(P), religious_personnel(P).

% criminal_liability(war_crime, Statute, D) :-
% 	protected_by_geneva_convention(V),
% 	international_conflict(D, V),
% 	elements(Statute, D, V).

% elements(article_8_2_a_i, D, V) :-
% 	act(D, killed, V).

% elements(article_8_2_a_ii, D, V) :-
% 	act(D, tortured, V).



:- dynamic genocidal_intent/2.

:- dynamic national_group/1.
:- dynamic ethnical_group/1.
:- dynamic racial_group/1.
:- dynamic religious_group/1.


:- dynamic act/3.

:- dynamic international_conflict/2.
:- dynamic civilian/1.
:- dynamic person/1.
:- dynamic prisoner_of_war/1.
:- dynamic medical_personnel/1.
:- dynamic religious_personnel/1.
