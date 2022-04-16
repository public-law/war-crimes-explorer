# War Crimes Explorer

In support of Ukraine, we're educating the world about war crimes through several projects.

The War Crimes Explorer is starting development today:

* In-browser learning about genocide, war crimes, crimes against humanity, and aggression.
* Interactively enter facts and discover the laws that might have been broken.
* Possibly submit the information to the ICC (International Criminal Court) as a witness statement.

## Status: First rough code and looking for assistance.
Volunteers and paid contributors are welcome, depending on experience.

I have a background in Expert Systems, and so that's my first idea for implementing the Explorer.
**I'm open to any ideas for implementing this.**
Prolog seems like a good match for modelling legal statutes. [Tau Prolog](http://tau-prolog.org) runs in the browser.
Here's a first little try:

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
	international_conflict(D, V),
	elements(Statute, D, V).


elements(article_8_2_a_i, D, V) :-
	act(D, killed, V).

elements(article_8_2_a_ii, D, V) :-
	act(D, tortured, V).     
```

* CLIPS is another option, possibly run in the browser via a [clipspy](https://github.com/noxdafox/clipspy) server.
* [Vaticle Type DB](https://vaticle.com/) is another possibility.
* What else? Some kind of very intelligent chatbot framework?
