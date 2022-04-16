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
 * https://world.public.law/rome_statute/article_6_genocide
 */
criminal_liability(genocide, Statute, D, V) :-
	elements(Statute, D, V).

/*
 * War crimes
 * https://world.public.law/rome_statute/article_8_war_crimes
 */
criminal_liability(war_crime, Statute, D, V) :-
	protected_by_geneva_convention(V),
	international_conflict(D, V),
	elements(Statute, D, V).


elements(article_8_2_a_i, D, V) :-
	act(D, killed, V).

elements(article_8_2_a_ii, D, V) :-
	act(D, tortured, V).     
```
