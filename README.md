# War Crimes Explorer
In-browser learning about genocide, war crimes, crimes against humanity, and aggression.
Interactively enter facts and discover the applicable international laws.

## Status: First rough code and looking for assistance.

I have a background in Expert Systems, and so that's my first idea for implementing the Explorer.
Prolog seems like a good match for modelling legal statutes:

```prolog
crime(genocide).
crime(war_crime).
crime(crime_of_aggression).
crime(crime_against_humanity).


/*
 * D = Defendant
 * V = Victim
 */
criminal_liability(war_crime, Article, D, V) :- 
        protected_person(V),
        knowledge_of_protected_status(D, V),      
        international_conflict(D, V),
        knowledge_of_international_conflict(D),   
        elements(Article, D, V).            
        
criminal_liability(genocide, Article, D, V) :-
        elements(Article, D, V).
        
        
protected_person(P) :-
        civilian(P).

protected_person(P) :-
        pow(P).
        
        
elements(article_8_2_a, D, V) :-
        act(D, killed, V). 
        
elements(article_8_2_b, D, V) :-
        act(D, pillaged, V).   

```

