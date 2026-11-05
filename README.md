# Infrastructure as Code avec Terraform
## Simulation locale de Google Cloud Storage

## Présentation

Ce projet met en pratique les principes de l'Infrastructure as Code (IaC) avec Terraform, à travers la gestion d'un bucket compatible avec Google Cloud Storage.

Afin de réaliser les expérimentations sans compte Google Cloud ni moyen de paiement, le projet utilise **Fake GCS Server**, un émulateur local de l'API Google Cloud Storage exécuté avec Docker.

La deuxième version introduit une architecture Terraform modulaire et un pipeline CI avec GitHub Actions.

> **Important :** il s'agit d'une simulation locale. Aucune ressource réelle n'est créée sur Google Cloud Platform.

## Objectifs

- Comprendre les principes de l'Infrastructure as Code.
- Automatiser la gestion du cycle de vie des ressources.
- Structurer une configuration Terraform avec des modules réutilisables.
- Gérer et préserver l'état Terraform lors d'une évolution de l'architecture.
- Automatiser les vérifications avec GitHub Actions.
- Utiliser Docker pour simuler un service Cloud.

## Technologies utilisées

| Technologie | Utilisation |
|---|---|
| Terraform 1.17.1 | Infrastructure as Code |
| Google Terraform Provider 6.x | Gestion du bucket compatible GCS |
| Fake GCS Server | Émulation locale de l'API GCS |
| Docker Compose | Exécution de l'émulateur |
| Git | Gestion des versions |
| GitHub Actions | Intégration continue |
| PowerShell | Commandes et environnement Windows |

## Architecture du projet

```text
terraform-gcp-storage/
│
├── .github/
│   └── workflows/
│       └── terraform-ci.yml
│
├── modules/
│   └── storage_bucket/
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
│
├── main.tf
├── provider.tf
├── versions.tf
├── variables.tf
├── outputs.tf
│
├── docker-compose.yml
├── .gitignore
├── .terraform.lock.hcl
└── README.md
```

## Fonctionnalités

### 1. Infrastructure as Code

- Définition des ressources avec le langage HCL.
- Gestion d'un bucket de stockage via Terraform.
- Utilisation de variables et d'outputs.
- Gestion de l'état Terraform.

### 2. Architecture modulaire

Le module `storage_bucket` centralise la définition du bucket, ses variables et ses outputs.

Cette organisation facilite la réutilisation et la maintenance de la configuration.

### 3. Gestion de l'évolution de l'infrastructure

Utilisation du bloc `moved` pour déplacer une ressource vers un module sans la recréer ni la détruire.

### 4. Intégration continue avec GitHub Actions

Le workflow `terraform-ci.yml` automatise les vérifications suivantes :

- Vérification du format avec `terraform fmt`.
- Initialisation de Terraform.
- Validation de la configuration avec `terraform validate`.
- Prévisualisation des changements avec `terraform plan`.
- Démarrage et arrêt de Fake GCS Server dans le pipeline.

Le workflow effectue des vérifications et un plan Terraform. Il ne déploie aucune ressource sur Google Cloud.

## Installation et utilisation

### Prérequis

- Windows avec PowerShell
- Terraform
- Docker Desktop
- Git

### 1. Cloner le projet

```bash
git clone <URL_DU_DEPOT>
cd terraform-gcp-storage
```

### 2. Démarrer Fake GCS Server

```bash
docker compose up -d
```

### 3. Initialiser Terraform

```bash
terraform init
```

### 4. Vérifier la configuration

```bash
terraform fmt -check -recursive
terraform validate
```

### 5. Prévisualiser les changements

```bash
terraform plan
```

### 6. Appliquer la configuration locale

```bash
terraform apply
```

### 7. Consulter les outputs

```bash
terraform output
```

### 8. Nettoyer les ressources de la simulation

```bash
terraform destroy
```

## Sécurité et limites

- Le projet fonctionne avec un émulateur local et ne nécessite pas de compte GCP.
- Le jeton d'accès configuré dans `provider.tf` est fictif et réservé à l'émulateur.
- Les fonctionnalités de Fake GCS Server peuvent différer du comportement réel de Google Cloud Storage.
- Certains attributs de bucket ne sont pas reproduits fidèlement par l'émulateur.
- Le paramètre `force_destroy` est utilisé dans le cadre de cette démonstration locale. Son utilisation doit être réévaluée avant tout déploiement réel.

**Ne pas réutiliser la configuration du fournisseur ni le jeton fictif pour une connexion à Google Cloud réelle.**

## Évolutions du projet

- **Version 1.0 :** configuration Terraform initiale et simulation locale d'un bucket GCS.
- **Version 2.0 :** architecture modulaire, migration de ressource avec `moved` et intégration continue avec GitHub Actions.

## Auteur

Projet personnel réalisé dans le cadre de l'apprentissage des technologies Cloud, DevOps et Infrastructure as Code.
