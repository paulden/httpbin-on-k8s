# Terragrunt

Ce dossier comporte deux sous-dossiers :
- `terraform` : les modules Terraform utilisés pour déployer les ressources
- `environments` : pour chaque environnement, les fichiers Terragrunt faisant appel aux modules Terraform.

On provisionne les ressources via Terragrunt, les modules Terraform ne sont jamais `apply` directement.

Le but est de permettre une réutilisation facile si on souhaite décaler un nouvel environnement avec tous les
composants d'infrastructure (un peu over-engineered dans le cadre de ce projet).
