
# 🎵 Harmonia Digital - Projet de Modernisation Subsonic

Ruben Del-Pierro

Ce projet présente la conteneurisation et l'orchestration de l'application legacy Subsonic 6.1.6. L'objectif est de garantir la haute disponibilité, la sécurité et la persistance des données conformément aux exigences de l'entreprise Harmonia Digital.

## 🔗 Liens Externes
- **Dépôt Docker Hub** : [lasatou/subsonic:v1](https://hub.docker.com/r/lasatou/subsonic)

---

## 🛠 Choix Techniques & Analyse Critique

1. **Isolation & Compatibilité** : Utilisation d'une image de base `eclipse-temurin:8-jre-focal`. Subsonic 6.1.6 nécessite impérativement Java 8. L'utilisation de Docker évite les conflits de version sur les systèmes hôtes modernes.
2. **Haute Disponibilité** : Configuration de **3 répliques** via un Deployment Kubernetes. Si un pod échoue, le cluster garantit automatiquement le redémarrage d'une nouvelle instance.
3. **Persistance des Données** : Mise en œuvre d'un `PersistentVolumeClaim` (PVC). Sans cela, toute musique ajoutée ou configuration utilisateur serait perdue au redémarrage des pods.
4. **Correction Logicielle** : Un lien symbolique a été ajouté dans le Dockerfile (`/subsonic.war`) pour corriger un bug de chemin relatif propre à l'application originale.

---

## 🚀 Guide de Déploiement Pas-à-Pas

### 1. Prérequis
- Docker installé et configuré.
- Un cluster Kubernetes local (Minikube ou MicroK8s) actif.
- `kubectl` installé.

### 2. Déploiement avec Docker (Mode Test Rapide)
Pour tester l'image isolée sur votre machine :
```bash
# Récupérer l'image depuis Docker Hub
docker pull lasatou/subsonic:v1

# Lancer le conteneur sur le port 4040
docker run -d -p 4040:4040 --name subsonic-test lasatou/subsonic:v1

# Accès : Ouvrez http://localhost:4040
