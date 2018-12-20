%operateurs
:-op( 800, fx, si ),
  op( 700, xfx, alors ),
  op( 300, xfy, ou ),
  op( 200, xfy, et ).
:- dynamic fait/1.


%%%%% Base de Faits %%%%%
%
%%Reference: https://fr.wikipedia.org/wiki/Dinosaure#Classification

%%Bassin pointe vers l'arrière
fait(herrerasauridae(herrerasaurus)).
fait(herrerasauridae(staurikosaurus)).
%%Petits os fins et délicats
fait(coelophysoidea(coelophysis)).
fait(coelophysoidea(liliensternus)).
fait(coelophysoidea(dilophosaurus)).
%% Carnivore, Cornes sur la tête
fait(ceratosauria(ceratosaurus)).
fait(ceratosauria(majungasaurus)).
fait(ceratosauria(carnotaurus)).
%% GROS, carnivore, griffe surdimentionnée au premier doigt
fait(megalosauroidea(spinosaurus)).
fait(megalosauroidea(suchomimus)).
fait(megalosauroidea(torvosaurus)).
%% Carnivore, Pieds d'oiseaux
fait(avetheropoda(allosaurus)).
fait(avetheropoda(tyrannosaurus)).
fait(avetheropoda(velociraptor)).
%%Long cou, sur 2 pattes (main)
fait(sauropodomorphesBasaux(anchisaurus)).
fait(sauropodomorphesBasaux(plateosaurus)).
fait(sauropodomorphesBasaux(massospondylus)).
%Cou plus de la moitié de la longueur du corps
fait(sauropodesBasaux(mamenchisaurus)).
fait(sauropodesBasaux(omeisaurus)).
%sauropodeBasal a petit cou
fait(sauropodesBasaux(shunosaurus)).
%%Petites dents, crâne allongé
fait(diplodocoidea(diplodocus)).
fait(diplodocoidea(apatosaurus)).
fait(diplodocoidea(amargasaurus)).
%%Narines plus grosse que oeil
fait(macronaria(brachiosaurus)).
fait(macronaria(camarasaurus)).
fait(macronaria(ampelosaurus)).
%%Dents a grandes canines
fait(heterodontosauridae(heterodontosaurus)).
fait(heterodontosauridae(abrictosaurus)).
%%Pointes osseuses sur corps
fait(thyreophoresBasaux(scelidosaurus)).
fait(thyreophoresBasaux(scutellosaurus)).
%%Grandes plaques perpendiculaire sur le dos
fait(stegosauria(stegosaurus)).
fait(stegosauria(kentrosaurus)).
fait(stegosauria(huayangosaurus)).
%%Armure moulant le dos
fait(ankylosauria(euoplocephalus)).
fait(ankylosauria(edmontonia)).
fait(ankylosauria(ankylosaurus)).
%%Têtes osseuses épaisses (déformées)
fait(pachycephalosauria(prenocephale)).
fait(pachycephalosauria(pachycephalosaurus)).
fait(pachycephalosauria(stegoceras)).
%%Cornes sur la face
fait(ceratopsia(triceratops)).
fait(ceratopsia(protoceratops)).
fait(ceratopsia(torosaurus)).
%%Pieds d'oiseau + Bec
fait(ornithopodesBasaux(hypsilophodon)).
fait(ornithopodesBasaux(agilisaurus)).
fait(ornithopodesBasaux(leaellynasaura)).
%%Pieds d'oiseau + Bec de canard
fait(iguanodontia(iguanodon)).
fait(iguanodontia(edmontosaurus)).
fait(iguanodontia(parasaurolophus)).


%%%%% Classification de base %%%%%
%
%Séparation de base
si ornithischia(X) alors dinosaure(X).
si saurischia(X) alors dinosaure(X).
%Pieds d'oiseau (ornithopoda)
si iguanodontia(X) alors ornithopoda(X).
si ornithopodesBasaux(X) alors ornithopoda(X).
%Têtes étranges (marginocephalia)
si ceratopsia(X) alors marginocephalia(X).
si pachycephalosauria(X) alors marginocephalia(X).
%Cranes a cornes (Cerapoda)
si ornithopoda(X) alors cerapoda(X).
si marginocephalia(X) alors cerapoda(X).
%Armures en plaques(enrypoda)
si ankylosauria(X) alors eurypoda(X).
si stegosauria(X) alors eurypoda(X).
%Armures (thyreophora)
si eurypoda(X) alors thyreophora(X).
si thyreophoresBasaux(X) alors thyreophora(X).
%Bec d'oiseau (genasauria)
si cerapoda(X) alors genasauria(X).
si thyreophora(X) alors genasauria(X).
%Bassin d'oiseau (ornithischia)
si genasauria(X) alors ornithischia(X).
si heterodontosauridae(X) alors ornithischia(X).
%neosaurapoda
si macronaria(X) alors neosauropoda(X).
si diplodocoidea(X) alors neosauropoda(X).
%4 pattes (sauropoda)
si neosauropoda(X) alors sauropoda(X).
si sauropodesBasaux(X) alors sauropoda(X).
%Longs cous et pieds de reptiles (sauropodomorpha)
si sauropoda(X) alors sauropodomorpha(X).
si sauropodomorphesBasaux(X) alors sauropodomorpha(X).
%Queue raide (tetanurae)
si avetheropoda(X) alors tetanurae(X).
si megalosauroidea(X) alors tetanurae(X).
%neotherapoda
si tetanurae(X) alors neotheropoda(X).
si ceratosauria(X) alors neotheropoda(X).
%Pieds de bêtes (therapoda)
si neotheropoda(X) alors theropoda(X).
si coelophysoidea(X) alors theropoda(X).
%Bassin de lézard (saurischia)
si sauropodomorpha(X) alors saurischia(X).
si theropoda(X) alors saurischia(X).
si herrerasauridae(X) alors saurischia(X).



%Retourne un dinosaure de la classe X
exemple_de(X):- fait(X), ch_avant.

%Pour chaînage avant
exemple2_de(Y):-
   switch(Y, [ankylosauria: fait(ankylosauria(Y)),
              avetheropoda: fait(avetheropoda(Y)),
              cerapoda: fait(cerapoda(Y)),
              ceratopsia: fait(ceratopsia(Y)),
              ceratosauria: fait(ceratosauria(Y)),
              coelophysoidea: fait(coelophysoidea(Y)),
              dinosaure: fait(dinosaure(Y)),
              diplodocoidea: fait(diplodocoidea(Y)),
              eurypoda:  fait(eurypoda(Y)),
              genasauria: fait(genasauria(Y)),
              herrerasauridae: fait(herrerasauridae(Y)),
              heterodontosauridae: fait(heterodontosauridae(Y)),
              iguanodontia: fait(iguanodontia(Y)),
              macronaria: fait(macronaria(Y)),
              marginocephalia: fait(marginocephalia(Y)),
              megalosauroidea: fait(megalosauroidea(Y)),
              neosauropoda: fait(neosauropoda(Y)),
              neotheropoda: fait(neotheropoda(Y)),
              ornithischia: fait(ornithischia(Y)),
              ornithopoda: fait(ornithopoda(Y)),
              ornithopodesBasaux: fait(ornithopodesBasaux(Y)),
              pachycephalosauria: fait(pachycephalosauria(Y)),
              saurischia: fait(saurischia(Y)),
              sauropoda: fait(sauropoda(Y)),
              sauropodesBasaux: fait(sauropodesBasaux(Y)),
              sauropodomorpha: fait(sauropodomorpha(Y)),
              sauropodomorphesBasaux: fait(sauropodomorphesBasaux(Y)),
              stegosauria: fait(stegosauria(Y)),
              tetanurae: fait(tetanurae(Y)),
              theropoda: fait(theropoda(Y)),
              thyreophora: fait(thyreophora(Y)),
              thyreophoresBasaux: fait(thyreophoresBasaux(Y))
             ]), ch_avant.


%Verifie si le but est vrai
verifier(But):- ch_arriere(But).

%Recherche si le dinosaure X est dans la categorie Y
dinosaure_est(X,Y):-
   switch(X, [ankylosauria: ch_arriere(ankylosauria(Y)),
              avetheropoda: ch_arriere(avetheropoda(Y)),
              cerapoda: ch_arriere(cerapoda(Y)),
              ceratopsia: ch_arriere(ceratopsia(Y)),
              ceratosauria: ch_arriere(ceratosauria(Y)),
              coelophysoidea: ch_arriere(coelophysoidea(Y)),
              dinosaure: ch_arriere(dinosaure(Y)),
              diplodocoidea: ch_arriere(diplodocoidea(Y)),
              eurypoda:  ch_arriere(eurypoda(Y)),
              genasauria: ch_arriere(genasauria(Y)),
              herrerasauridae: ch_arriere(herrerasauridae(Y)),
              heterodontosauridae: ch_arriere(heterodontosauridae(Y)),
              iguanodontia: ch_arriere(iguanodontia(Y)),
              macronaria: ch_arriere(macronaria(Y)),
              marginocephalia: ch_arriere(marginocephalia(Y)),
              megalosauroidea: ch_arriere(megalosauroidea(Y)),
              neosauropoda: ch_arriere(neosauropoda(Y)),
              neotheropoda: ch_arriere(neotheropoda(Y)),
              ornithischia: ch_arriere(ornithischia(Y)),
              ornithopoda: ch_arriere(ornithopoda(Y)),
              ornithopodesBasaux: ch_arriere(ornithopodesBasaux(Y)),
              pachycephalosauria: ch_arriere(pachycephalosauria(Y)),
              saurischia: ch_arriere(saurischia(Y)),
              sauropoda: ch_arriere(sauropoda(Y)),
              sauropodesBasaux: ch_arriere(sauropodesBasaux(Y)),
              sauropodomorpha: ch_arriere(sauropodomorpha(Y)),
              sauropodomorphesBasaux: ch_arriere(sauropodomorphesBasaux(Y)),
              stegosauria: ch_arriere(stegosauria(Y)),
              tetanurae: ch_arriere(tetanurae(Y)),
              theropoda: ch_arriere(theropoda(Y)),
              thyreophora: ch_arriere(thyreophora(Y)),
              thyreophoresBasaux: ch_arriere(thyreophoresBasaux(Y))
             ]).

%Switch avec Goal
switch(X, [Val:Goal|Cases]) :-
    ( X=Val -> call(Goal) ; switch(X, Cases) ).


% ch_arriere/1 : moteur d inference fonctionnant en chainage arriere
ch_arriere( But ) :- est_vrai( But ).
est_vrai( Proposition ) :- fait( Proposition ).
est_vrai( Proposition ) :- si Condition alors Proposition, est_vrai( Condition ).
est_vrai( Cond1 et Cond2 ) :- est_vrai( Cond1 ), est_vrai( Cond2 ).
est_vrai( Cond1 ou Cond2 ) :- est_vrai( Cond1 ) ; est_vrai( Cond2 ).


% ch_avant/0 : moteur d inference fonctionnant en chainage avant
%ch_avant :-
%   nouveau_fait( Nouveau ), !,
%   write( 'Nouveau fait : ' ),
%   write( Nouveau ), nl,
%   assert( fait( Nouveau ) ), ch_avant.

ch_avant:-
	si COND alors X,
	not(fait(X)),
	condition_vraie(COND),
	!,
	write('nouveau fait : '), write(X),nl,
	asserta(fait(X)),
	ch_avant.
ch_avant :-
   write( 'Plus de nouveaux faits déduits, la BC est saturée.'), nl.
nouveau_fait( NouvFait ) :-   si Condition alors NouvFait, not( fait(NouvFait) ), recherche_fait( Condition ).
recherche_fait( Condition ) :- fait( Condition ).
recherche_fait( Cond1 et Cond2 ) :-
recherche_fait( Cond1 ), recherche_fait( Cond2 ).
recherche_fait( Cond1 ou Cond2 ) :-
recherche_fait( Cond1 ) ; recherche_fait( Cond2 ).

/* condition_vraie/1 : même chose que le prédicat est_vrai/1, mais sans remonter dans les règles à partir des buts */
condition_vraie(C):- fait(C).
condition_vraie(C1 et C2):- condition_vraie(C1), condition_vraie(C2).
condition_vraie(C1 ou C2):- condition_vraie(C1) ; condition_vraie(C2).
