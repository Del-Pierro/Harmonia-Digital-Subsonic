# Harmonia-Digital-Subsonic
DelPierro Ruben
Ce dépôt contient la solution de conteneurisation et d'orchestration pour l'application Subsonic 6.1.6, réalisée dans le cadre du projet de modernisation de l'infrastructure.

## 🚀 Liens du projet
- **Docker Hub** : [lasatou/subsonic:v1](https://hub.docker.com/r/lasatou/subsonic)
- **Image de base** : Java 8 (Temurin)

## 🛠 Choix Techniques & Analyse (Livrable 4)
- **Runtime** : Utilisation de Java 8 indispensable pour la compatibilité du bytecode de l'application legacy.
- **Résilience** : Déploiement Kubernetes avec **3 répliques** pour garantir une haute disponibilité.
- **Persistance** : Mise en place d'un `PersistentVolumeClaim` (PVC) pour conserver la base de données et les musiques malgré le redémarrage des pods.
- **Correctif appliqué** : Création d'un lien symbolique pour le fichier `subsonic.war` afin de pallier un bug de chemin relatif dans l'application d'origine.

## 📦 Guide de déploiement

### 1. Docker (Local)
```bash
docker pull lasatou/subsonic:v1
docker run -d -p 4040:4040 lasatou/subsonic:v1
