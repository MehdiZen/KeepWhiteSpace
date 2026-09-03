# Tests unitaires — Keep White Space

> ⚠️ **Le jeu de ce dépôt n'est pas de moi.**
> `main.js` et `index.html` sont l'œuvre d'un tiers, reprise ici comme cible d'un exercice de
> tests automatisés pendant ma formation (2023).
> **Ma contribution se limite à `tests/`, `nightwatch/` et la configuration associée.**
>
> *L'auteur d'origine reste à créditer nommément — lien à ajouter.*

---

## Ce que je teste

`tests/main.test.js`, en Jest sous environnement jsdom, sur les deux briques exportées par
`main.js` : la classe vectorielle `Vec` et `GameStatus`.

**Algèbre vectorielle.** Construction, `add`, `mul`, `dot`, `cross`, puis une composition qui
enchaîne les quatre en une seule expression — le genre de cas qui casse dès qu'une opération
mute son opérande au lieu d'en retourner un nouveau.

**Cas limites.** Deux tests visent délibérément le mauvais usage plutôt que le bon :

`add(3)` avec un nombre au lieu d'un vecteur ne lève pas d'erreur, il retourne un `Vec` dont
les deux composantes valent `NaN`. Le test fige ce comportement au lieu de faire semblant qu'il
n'existe pas.

`getTimeStr(-123456)` sur une durée négative produit `"-3:-4.-4"`. Ce n'est évidemment pas un
temps valide : le formatage applique ses divisions et ses modulos sans jamais vérifier le signe.
Le test documente le bug plutôt que de le contourner.

C'est le point de l'exercice : sur du code qu'on n'a pas écrit, un test ne sert pas à prouver
que tout va bien, il sert à établir ce que le code fait réellement, y compris là où il se
trompe.

## Lancer

```bash
npm install
npm test
```
