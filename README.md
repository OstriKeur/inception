# Inception

Infrastructure Docker complète avec WordPress, MariaDB et Redis - Projet 42 Paris

## À propos

Inception est un projet DevOps avancé qui consiste à créer une infrastructure complète avec Docker et Docker Compose. L'objectif est de mettre en place un environnement WordPress fonctionnel avec une base de données MariaDB, un cache Redis, et un serveur web Nginx, le tout containerisé.

C'est un projet complexe qui m'a permis de comprendre Docker en profondeur, la gestion d'infrastructure, et la configuration de services multiples qui communiquent entre eux.

## Architecture

L'infrastructure comprend :

- **Nginx** : Serveur web et reverse proxy
- **WordPress** : CMS avec PHP-FPM
- **MariaDB** : Base de données
- **Volumes Docker** : Persistance des données
- **Réseaux Docker** : Isolation et communication entre services

## Installation et utilisation

### Prérequis

- Docker
- Docker Compose
- Make (optionnel, pour les commandes simplifiées)

### Démarrage

```bash
make
# ou
docker-compose up --build
```

L'application sera accessible sur `https://localhost` (ou l'IP configurée)

### Arrêt

```bash
docker-compose down
# ou avec volumes
docker-compose down -v
```

## Structure du projet

```
inception/
├── srcs/
│   ├── mariadb/        # Configuration MariaDB
│   │   ├── Dockerfile
│   │   └── mdb-conf.sh
│   ├── nginx/          # Configuration Nginx
│   │   ├── Dockerfile
│   │   └── nginx.conf
│   └── wordpress/      # Configuration WordPress
│       ├── Dockerfile
│       └── wp_conf.sh
├── docker-compose.yml  # Orchestration des services
└── Makefile           # Commandes simplifiées
```

## Configuration

Les services sont configurés via des variables d'environnement dans `docker-compose.yml` :
- **Mariadb** : Base de données, utilisateur, mot de passe
- **WordPress** : Configuration de connexion à la base de données
- **Nginx** : Configuration SSL/TLS, domaines

Le projet inclut la configuration SSL avec des certificats pour le développement.

## Ce que j'ai appris

- Création et optimisation d'images Docker
- Orchestration de services multiples avec Docker Compose
- Multi-stage builds pour optimiser les images
- Gestion de la persistance des données avec volumes et bind mounts
- Isolation et communication entre conteneurs avec réseaux Docker
- Configuration de reverse proxy et SSL avec Nginx
- Configuration de base de données avec MariaDB
- Configuration et déploiement de WordPress
- Gestion d'infrastructure avec fichiers de configuration
- Automatisation de la configuration avec scripts shell

## Sécurité

- Utilisation de variables d'environnement pour les secrets
- Configuration SSL/TLS
- Isolation des services avec réseaux Docker
- Volumes nommés pour la persistance sécurisée

## Commandes utiles

```bash
# Voir les logs
docker-compose logs -f

# Redémarrer un service
docker-compose restart nginx

# Voir les conteneurs
docker-compose ps

# Accéder à un conteneur
docker-compose exec mariadb bash
```

## Notes importantes

- Les fichiers `.env` ne sont pas inclus dans le repository pour des raisons de sécurité
- Les certificats SSL sont configurés pour le développement
- Les données sont persistées dans des volumes Docker

---

**Projet réalisé dans le cadre du cursus 42 Paris**
