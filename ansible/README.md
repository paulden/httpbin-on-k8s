# Ansible

Ce dossier comporte un playbook Ansible qui joue deux roles :
- `kubeconfig` : récupération du KUBECONFIG pour accéder au cluster
- `argocd` : déploiement des ressources de base (namespace, secret) pour installer ArgoCD avec Helm, puis déployer une application `apps-alls`

Pour chaque environnement, on a un inventaire différent. Les variables secrètes sont dans un `vault.yml` chiffré avec
une clé dans le fichier `ansible_vault_file` non versionné.
