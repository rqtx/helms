deploy:
  helm package app
  helm repo index app --url https://rqtx.github.io/helms/
