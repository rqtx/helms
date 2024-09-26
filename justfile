deploy:
  helm package app
  helm repo index . --url https://rqtx.github.io/helms/
