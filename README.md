# Infrastructure as Code avec Terraform – Simulation Google Cloud Storage

## Présentation

Ce projet consiste à provisionner et gérer un bucket de stockage compatible avec Google Cloud Storage à l'aide de Terraform.

Pour réaliser les tests sans compte Google Cloud ni facturation, le projet utilise **Fake GCS Server**, un émulateur local de l'API Google Cloud Storage exécuté avec Docker.

L'objectif est de mettre en pratique les principes d'Infrastructure as Code (IaC), d'automatisation, de reproductibilité et de gestion du cycle de vie des ressources.

## Architecture

- **Terraform** : définition et gestion de l'infrastructure.
- **Google Terraform Provider** : interaction avec l'API compatible GCS.
- **Fake GCS Server** : simulation locale de Google Cloud Storage.
- **Docker Compose** : lancement de l'émulateur.

## Technologies utilisées

- Terraform 1.17.1
- Docker et Docker Compose
- Google Terraform Provider 6.x
- Fake GCS Server
- PowerShell
- Git

## Fonctionnalités réalisées

- Configuration de l'infrastructure avec HCL.
- Création d'un bucket de stockage local.
- Gestion de l'état Terraform.
- Utilisation de variables et outputs.
- Vérification de la configuration avec `terraform validate`.
- Vérification de l'idempotence avec `terraform plan`.
- Protection des fichiers sensibles avec `.gitignore`.

## Structure du projet

```text
terraform-gcp-storage/
├── main.tf
├── provider.tf
├── versions.tf
├── variables.tf
├── outputs.tf
├── docker-compose.yml
├── .gitignore
├── .terraform.lock.hcl
└── README.md
```

## Installation et utilisation

### 1. Démarrer l'émulateur

```bash
docker compose up -d
```

### 2. Initialiser Terraform

```bash
terraform init
```

### 3. Vérifier la configuration

```bash
terraform fmt
terraform validate
```

### 4. Prévisualiser les changements

```bash
terraform plan
```

### 5. Appliquer la configuration

```bash
terraform apply
```

### 6. Consulter les outputs

```bash
terraform output
```

### 7. Supprimer les ressources locales

```bash
terraform destroy
```

## Limites de la simulation

Ce projet utilise un émulateur local et ne crée aucune ressource réelle sur Google Cloud Platform.

Certaines fonctionnalités de l'API GCS, notamment la persistance de certains attributs de bucket, peuvent différer du comportement du service Google Cloud Storage réel.

Le jeton d'accès configuré dans `provider.tf` est fictif et réservé à l'émulateur local.

## Objectifs pédagogiques

- Comprendre les concepts d'Infrastructure as Code.
- Automatiser le provisionnement des ressources.
- Manipuler Terraform et son mécanisme de State.
- Utiliser Docker pour simuler un service Cloud.
- Appliquer des pratiques de sécurité et de gestion de configuration.