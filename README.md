# War Crimes Explorer
In-browser learning about genocide, war crimes, crimes against humanity, and aggression.
Interactively enter facts and discover the applicable international laws.

## Status: First rough code and looking for assistance.

I have a background in Expert Systems, and so that's my first idea for implementing the Explorer.
**I'm open to any ideas for implementing this.**
Prolog seems like a good match for modelling legal statutes. Here's a first little try:

```prolog
/*
 * Crimes within the jurisdiction of the International Criminal Court.
 * 
 * https://world.public.law/rome_statute/article_5
 */
crime(genocide).
crime(war_crime).
crime(crime_against_humanity).
crime(crime_of_aggression).


/*
 * A first, simple attempt at Protected Persons under
 * the Geneva Conventions of 1949.
 */
protected_by_geneva_convention(P) :- civilian(P).
protected_by_geneva_convention(P) :- prisoner_of_war(P).
protected_by_geneva_convention(P) :- medical_personnel(P).
protected_by_geneva_convention(P) :- religious_personnel(P).


/*
 * D = Defendant
 * V = Victim
 */

/*
 * Genocide
 * https://world.public.law/rome_statute/article_6
 */
criminal_liability(genocide, Statute, D, V) :-
	elements(Statute, D, V).

/*
 * War crimes
 * https://world.public.law/rome_statute/article_8
 */
criminal_liability(war_crime, Statute, D, V) :-
	protected_by_geneva_convention(V),
	knowledge_of_protected_status(D, V),
	international_conflict(D, V),
	knowledge_of_international_conflict(D),
	elements(Statute, D, V).


elements(article_8_2_a_i, D, V) :-
	act(D, killed, V).

elements(article_8_2_a_ii, D, V) :-
	act(D, tortured, V).     
```
