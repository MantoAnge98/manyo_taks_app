# el-formation

## À propos de ce programme

Ce document est un programme pour la formation des nouveaux employés afin d'apprendre les bases de Ruby on Rails et de ses technologies périphériques, qui sont essentielles pour Manyo.
Indépendamment de la capacité des nouveaux employés, vous devrez effectuer une étape.
La période de formation n'est pas précisée.
La formation sera terminée lorsque toutes les étapes seront terminées.

Les caractères suivants sont supposés dans ce programme.

--Nouvel employé: étudiant de ce programme.
--Supporter: Nous fournissons une formation, des conseils et des conseils aux nouveaux employés. Il joue également le rôle de consulter les nouveaux employés et de décider ensemble des spécifications.

Il est à la discrétion du supporter dans quelle mesure le supporter est impliqué dans le guidage. De plus, en ce qui concerne la période de formation, les accompagnateurs fixeront à l'avance une ligne directrice en tenant compte du niveau de compétence des nouveaux employés et de l'état des projets internes.

## Aperçu

### Configuration requise

Dans ce programme, il vous sera demandé de développer un système de gestion des tâches en tant que problème.
Le système de gestion des tâches souhaite effectuer les opérations suivantes:

――Je souhaite enregistrer facilement ma tâche
--Je souhaite pouvoir définir une date d'expiration pour une tâche
--Je veux hiérarchiser les tâches
--Je veux gérer l'état (pas commencé / commencé / terminé)
--Je veux affiner les tâches par statut
--Je souhaite rechercher une tâche par nom de tâche / description de tâche
- Je veux lister les tâches. Je souhaite trier sur l'écran de liste (en fonction de la priorité, de la date d'expiration, etc.)
--Je veux classer les tâches avec des étiquettes, etc.
--Je souhaite m'inscrire en tant qu'utilisateur afin de ne voir que les tâches que j'ai enregistrées.

De plus, afin de répondre aux exigences ci-dessus, nous souhaitons les fonctions de gestion suivantes.

--Fonction de gestion des utilisateurs

### Navigateur d'assistance

- Le navigateur de support est supposé être la dernière version de macOS / Chrome

### À propos de la configuration de l'application (serveur)

Je voudrais que vous construisiez en utilisant les langages et middleware suivants (tous sont les dernières versions stables).

--Rubis
--Ruby sur rails
--PostgreSQL

Pour le serveur, veuillez utiliser ce qui suit.

--Heroku

* Les exigences de performance et les exigences de sécurité ne sont pas spécifiées, mais veuillez respecter la qualité générale.
  Si le site ne répond pas trop, veuillez l'améliorer.

## Objectif ultime de ce programme

À la fin de ce programme, on suppose que vous apprendrez les éléments suivants.

- Être capable de mettre en œuvre des applications Web de base à l'aide de Rails
- Etre capable de publier une application en utilisant un environnement général dans une application Rails
- Fonctions supplémentaires et maintenance des données pour les applications Rails publiées
- Apprenez le flux des relations publiques et de la fusion sur GitHub. Apprenez également les commandes Git requises pour cela.
  - Être capable de s'engager avec une granularité appropriée
  - Etre capable de rédiger une description PR appropriée
  - Être capable de répondre aux avis et d'apporter des corrections
- Être capable de poser des questions aux membres de l'équipe et aux parties liées (cette fois, je serai un supporter) verbalement ou par chat au bon moment.

## Livres recommandés

Pour faire progresser le programme de formation, nous recommandons les livres suivants comme livres recommandés.

- [Guide pratique d'apprentissage rapide Ruby on Rails 5 utilisable sur le terrain] (https://book.mynavi.jp/ec/products/detail/id=93905)

Le guide pratique d'apprentissage rapide Ruby on Rails 5 qui peut être utilisé sur le terrain se concentre sur le système de gestion des tâches ainsi que sur le programme de formation.
Par conséquent, je pense qu'il y a de nombreux points qui peuvent être utiles pour faire progresser cette formation.

En outre, le contenu qui n'a pas pu être couvert dans cette formation et la façon de procéder au développement de l'équipe sont également expliqués. Veuillez vous y référer.

## Collection de sujets utiles pour le développement

Les sujets dont je voudrais que vous profitiez sont résumés dans topics.md, bien qu'ils n'aient pas été inclus dans les étapes spécifiques du problème. Veuillez vous y référer et l'utiliser si nécessaire lors de la mise en œuvre du programme.

## Étape du défi

### Étape 1: Créer un environnement de développement Rails

#### 1-1: Installez Ruby

-Utilisez [rbenv] (https://github.com/rbenv/rbenv) pour installer la dernière version de Ruby
--Vérifiez que la commande `ruby -v` affiche la version Ruby

#### 1-2: Installation des rails

--Installer des rails avec la commande Gem
- Veuillez installer la dernière version de Rails
- Assurez-vous que la version Rails est affichée avec la commande `rails -v`

#### 1-3: Installation de la base de données (PostgreSQL)

- Installons PostgreSQL sur votre OS
  - Pour macOS, installez avec `brew` etc.

### Étape 2: Créez un référentiel sur GitHub

--Installez Git à portée de main
  - Pour macOS, installez avec `brew` etc.
  - Enregistrez votre nom d'utilisateur et votre adresse e-mail avec `gitconfig`
- Pensons au nom de l'application (= nom du référentiel)
- Créons un référentiel
  --Si vous n'avez pas de compte, obtenez-en un
  - Créons un dépôt vide dessus

### Étape 3: créer un projet Rails

--Créez les répertoires et fichiers minimum requis pour votre application avec la commande `rails new`
--Créez un répertoire appelé `docs` directement sous le répertoire du projet (répertoire du nom de l'application) créé par` rails new`, et validez ce fichier de document.
  ―― Il s'agit de garder les spécifications de cette application sous contrôle afin que vous puissiez les voir à tout moment.
--Pousser l'application créée dans le référentiel créé sur GitHub
- Afin de spécifier la version, décrivez la version de Ruby à utiliser dans `Gemfile` (Assurez-vous que la version est déjà décrite pour Rails).

### Étape 4: Pensez à l'image de l'application que vous souhaitez créer

――Avant de concevoir, réfléchissons à l'image complète (avec les supporters) du type d'application qu'il s'agira. La conception d'écran par prototypage papier est recommandée
  ―― Réfléchissons à la manière dont cette application sera utilisée (si elle sera publiée sur Internet, pour un usage interne, etc ...) (avec les supporters).
- Lisez la configuration système requise et réfléchissez à la structure de données dont vous avez besoin
  ―― Quel type de modèle (tableau) semble être nécessaire
  ―― De quel type d'informations le tableau a-t-il besoin?
――Si vous pensez à la structure des données, écrivons-la à la main sur le diagramme du modèle.
  ――Une fois terminé, prenez une photo et placez-la dans le référentiel
  - Ecrire le schéma de la table dans `README.md` (nom du modèle, nom de la colonne, type de données)

* Il n'est pas nécessaire de créer un diagramme de modèle correct pour le moment. Faisons-en une hypothèse pour le moment (imaginez le réparer si vous pensez qu'il est faux dans les prochaines étapes)

### Étape 5: Définissons la connexion à la base de données (paramètres du périphérique)

- Tout d'abord, coupons une nouvelle branche de sujet avec Git
  ――Après cela, nous travaillerons sur la branche thématique et nous engagerons
--Installer Bundler
--Installez `pg` (pilote de base de données PostgreSQL) avec` Gemfile`
- Définissons `database.yml`
--Créez une base de données avec la commande `rails db: create`
- Vérifions la connexion à la base de données avec la commande `rails db`
--Créez un PR sur GitHub pour examen
  - Émettons PR avec WIP (travail en cours) au besoin. Veuillez vous référer à la collection de sujets pour plus de détails.
  --Si vous avez des commentaires, veuillez répondre en conséquence. Si vous avez 2 LGTM (Looks Good To Me), fusionnez-les dans la branche principale.

### Étape 6: Créons un modèle de tâche

Créez un CRUD pour gérer la tâche.
Tout d'abord, faisons-le avec une structure simple où seuls le nom et les détails peuvent être enregistrés.

--Créez la classe de modèle requise pour la tâche CRUD avec la commande `rails generate`
--Créez une migration et utilisez-la pour créer une table
  ――Il est important de s'assurer que la migration peut revenir à l'état précédent! Prenez l'habitude de jouer à "redo" pour vérifier
  ―― Assurez-vous également de définir les restrictions de base de données.
--Assurez-vous que vous pouvez vous connecter à la base de données via le modèle avec la commande `rails c`
  - À ce stade, essayons de créer un enregistrement avec ActiveRecord.
- Let's set validation
  - Réfléchissons à quelle validation ajouter à quelle colonne
--Créez un PR sur GitHub pour examen

### Étape 7: Autoriser l'affichage / l'enregistrement / la mise à jour / la suppression des tâches

Créons un écran de liste de tâches, un écran de détail, un écran de création, un écran d'édition et une fonction de suppression.

La création de ces fonctionnalités en même temps a tendance à rendre le PR énorme.
Par conséquent, à l'étape 7, PR sera divisé en plusieurs parties.

Dans les prochaines étapes, si le PR est susceptible d'augmenter, demandez-vous si vous pouvez émettre le PR en deux ou plus.

### Étape 7-1: Créer un écran de liste de tâches et un écran de détail

- Permet d'afficher la tâche créée à l'étape 6 sur l'écran de liste et l'écran de détail.
--Créez des contrôleurs et des vues avec la commande `rails generate`
  - Consultez vos supporters pour décider quel moteur de modèle utiliser.
- Ajouter les implémentations requises pour le contrôleur et afficher
--Modifiez `routes.rb` pour que l'écran de la liste des tâches s'affiche à` http: // localhost: 3000 /`
- Expliquons aux supporters ce qui se passe entre le navigateur Web et le serveur.
--Créez un PR sur GitHub pour examen

### Étape 7-2: Créons un écran de création de tâche et un écran d'édition

- Pouvons créer et éditer des tâches à partir de l'écran
--Afficher un message flash sur l'écran après la création et la mise à jour.
  - Si une erreur de validation se produit, affichez un message d'erreur à l'écran.
--Créez un PR sur GitHub pour examen

### Étape 7-3: Pouvons supprimer la tâche

- Pouvons supprimer la tâche créée
--Afficher un message flash sur l'écran après la suppression
--Créez un PR sur GitHub pour examen

### Étape 7-4: Revenons au code ajouté

- Expliquons le code ajouté aux étapes 7-1 à 7-3 aux supporters.
  --À propos des classes, méthodes et variables
  - À propos du flux de traitement

### Étape 8: Entrons en contact avec SQL

- Exploitons la base de données
  --Connectez-vous à la base de données avec la commande `rails db`
  - Afficher, créer, mettre à jour et supprimer des tâches avec SQL
- Accédez à l'écran de la liste des tâches et vérifiez que le journal SQL circule.
  - Expliquons aux supporters quel type de SQL est exécuté
- Vérifions quel type de SQL est exécuté par la méthode ActiveRecord
  - Lançons `find`,` where`, etc. avec `rails c`

### Étape 9: rédigez un test

- Préparez-vous à écrire la spécification
  --Préparer `spec / spec_helper.rb` et` spec / rails_helper.rb`
- Écrivons une spécification de modèle pour validation
  En fait, je n'écris pas beaucoup de test de validation, mais faisons-le pour approfondir la compréhension des spécifications du modèle.
- Écrivons une spécification système pour la fonction de tâche
--Introduisez un outil CI tel que Circle CI pour notifier Slack
  ―― Peu importe si le supporter l'implémente, compte tenu du niveau de difficulté.
- Livre de référence: https://leanpub.com/everydayrailsrspec-jp

### Étape 10: Partageons la partie japonaise de l'application

- Utilisons le mécanisme i18n de Rails pour afficher les messages d'erreur de validation en japonais.

### Étape 11: Définir le fuseau horaire des rails

--Définir le fuseau horaire Rails au Japon (Tokyo)

### Étape 12: Triez la liste des tâches par ordre de date et d'heure de création

――Actuellement, ils sont classés dans l'ordre des ID, mais trions-les par ordre décroissant de date et d'heure de création.
- Écrivons dans la spécification système que le tri fonctionne bien

### Étape 13: déployons

- Maintenant que vous avez un système de gestion des tâches simple dans la branche principale, déployons-le.
- Déployons-nous sur Heroku
  --Si vous n'avez pas de compte, créez-en un
- Touchons l'application Heroku déployée
  ――À partir de maintenant, enregistrons les tâches dans cette application et procédons au développement.
  - * Cependant, l'application Heroku peut être référencée n'importe où sur Internet, veuillez donc ne pas publier d'informations qui sont mauvaises pour la publication.
    - L'authentification de base peut être incluse à ce stade
  - À partir de maintenant, déployons continuellement votre application sur Heroku après chaque étape
- Décrivons la méthode de déploiement dans `README.md`
  À ce moment-là, il est encore mieux d'inclure les informations de version du framework utilisé dans cette application.

### Étape 14: Ajouter une date d'expiration

- Permettons d'enregistrer une date d'expiration pour une tâche
- Pouvons trier par date d'expiration sur l'écran de liste
- Développons les spécifications
――Si vous publiez et obtenez un avis, publions-le

### Étape 15: Ajouter un statut pour le rendre consultable

- Ajoutons le statut (non commencé / commencé / terminé)
  - [Option] Si vous n'êtes pas un débutant, vous pouvez installer un Gem qui gère l'état.
- Rendons possible la recherche par titre et statut sur l'écran de liste
  - [Option] Si vous n'êtes pas un débutant, vous pouvez installer un Gem qui facilite la mise en œuvre d'une recherche telle que le ransack.
- Lors de la réduction, vérifions les changements dans le SQL émis en regardant le journal.
  ―― Prenez l'habitude de vérifier au besoin dans les étapes suivantes
- Collez l'index de recherche
  --Préparez une certaine quantité de données de test, vérifiez l'opération en regardant log / development.log et confirmez que l'ajout d'un index améliore la vitesse.
  - [Option] Vérifions l'état d'utilisation de l'index côté base de données à l'aide de PostgreSQL, expliquez, etc.
- Ajoutons une spécification de modèle à la recherche (développons également la spécification du système)

### Étape 16: Définissez les priorités (* Peut être omis si vous avez une expérience de mise en œuvre similaire)

- Permettons d'enregistrer les priorités (élevées, moyennes, faibles) pour les tâches
- Trions par priorité
- Développons les spécifications du système
――Si vous publiez et obtenez un avis, publions-le (veuillez continuer)

### Étape 17: Ajoutons la pagination

- Ajoutons une pagination à l'écran de liste en utilisant une gemme appelée Kaminari

### Étape 18: devinez le design

--Introduisez Bootstrap et appliquez le design aux applications que vous avez créées jusqu'à présent
  - [Option] Écrivez et concevez votre propre CSS

### Étape 19: Rendez-le disponible à plusieurs personnes (présentation de l'utilisateur)

- Créons un modèle utilisateur
- Créons le premier utilisateur avec des semences
- Connectons les utilisateurs et les tâches
  - Indexons l'association
  - * Lors du déploiement sur Heroku, assurez-vous que la tâche déjà enregistrée est liée à l'utilisateur (maintenance des données).

### Étape 20: Implémentez la fonctionnalité de connexion / déconnexion

- Implémentons-le vous-même sans utiliser de gemmes supplémentaires
  - Le but est d'approfondir votre compréhension du fonctionnement des cookies HTTP et des sessions dans Rails en n'utilisant pas de gemmes telles que Devise.
  ―― Le but est également d'approfondir votre compréhension de l'authentification générale (comme la gestion des mots de passe).
- Implémentons un écran de connexion
- Si vous n'êtes pas connecté, assurez-vous que vous ne pouvez pas accéder à la page de gestion des tâches.
--Afficher uniquement les tâches que vous avez créées
- Implémentons la fonction de déconnexion

### Étape 21: Implémentons l'écran de gestion des utilisateurs

- Ajoutons un menu de gestion à l'écran
- Assurez-vous de préfixer l'écran d'administration avec l'URL `/ admin`
  --Avant d'ajouter à `routes.rb`, concevons en supposant à l'avance l'URL et le nom de routage (nom qui devient` * _path`).
- Implémentons la liste des utilisateurs / créer / mettre à jour / supprimer
--Une fois que vous supprimez un utilisateur, essayez de supprimer les tâches de l'utilisateur.
--Afficher le nombre de tâches que l'utilisateur a sur l'écran de la liste des utilisateurs.
  --Intégrer un mécanisme pour éviter le problème N + 1
- Voyons la liste des tâches créées par l'utilisateur

### Étape 22: Ajoutons un rôle à l'utilisateur

- Faisons la distinction entre les utilisateurs administratifs et les utilisateurs généraux
- Rendons l'écran de gestion des utilisateurs accessible uniquement à l'utilisateur de gestion
  - Faisons une exception spéciale lorsqu'un utilisateur général accède à l'écran de gestion
  --Catch l'exception et afficher la page d'erreur de manière appropriée (vous pouvez le faire à l'étape 24)
- Permettons de sélectionner un rôle sur l'écran de gestion des utilisateurs
- Contrôlons la suppression afin qu'aucun utilisateur administratif ne soit perdu
  - Utilisons le rappel de modèle
- * Vous pouvez utiliser ou non Gem librement.

### Étape 23: Pouvons étiqueter les tâches

- Autorisons les tâches à avoir plusieurs étiquettes
―― Rendons possible la recherche par l'étiquette attachée

### Étape 24: Définissez correctement la page d'erreur

- Faisons de la page d'erreur par défaut fournie par Rails l'écran que vous avez créé.
- Réglez la page d'erreur de manière appropriée en fonction de la situation
  - Deux types de paramètres de code d'état, page 404 et page 500, sont requis au moins.

## Postscript

Je vous remercie pour votre travail acharné.
Vous avez terminé tout le programme éducatif !!

Je ne pourrais pas le couvrir dans ce programme, mais je pense que les sujets suivants seront nécessaires à l'avenir, donc je pense que c'est une bonne idée de poursuivre l'étude (je pense que vous apprendrez souvent à travers des projets).

- Approfondir une compréhension de base des applications Web
  --Comprendre HTTP et HTTPS
- Apprenez à utiliser un peu plus avancé les rails
  --STI
  --Enregistrement
  - Transaction explicite
  --Traitement asynchrone
  - Pipeline d'actifs (plutôt un sujet de publication)
- Une compréhension plus avancée des interfaces telles que JavaScript et CSS
- Approfondissez votre compréhension de la base de données
  --SQL
  ――Construire des requêtes qui mettent l'accent sur les performances
  —— Approfondissez votre compréhension de l'index
- Plus de compréhension de l'environnement du serveur
  - Système d'exploitation Linux
  - Paramètres du serveur Web (Nginx)
  - Paramètres du serveur d'applications (Licorne)
  - Comprendre les paramètres liés à PostgreSQL
--Comprendre les outils de publication
  --Capistrano
  --Ansible