{{/*
Expand the deployment pod security context.
*/}}
{{- define "app.deployment.podSecurityContext" -}}
{{- if eq .Values.podSecurityStandards "Privileged" -}}
runAsUser: 0
runAsGroup: 0
fsGroup: 0
seccompProfile:
  type: RuntimeDefault
{{- else -}}
runAsUser: 1001
runAsGroup: 1001
fsGroup: 1001
seccompProfile:
  type: RuntimeDefault
{{- end -}}
{{- end }}

{{/*
Expand the deployment security context.
*/}}
{{- define "app.deployment.securityContext" -}}
{{- if eq .Values.podSecurityStandards "Privileged" -}}
privileged: true
readOnlyRootFilesystem: false
allowPrivilegeEscalation: true
runAsNonRoot: false
capabilities:
  drop:
    - ALL
  add: {{ .Values.capabilities }}
{{- else -}}
privileged: false
readOnlyRootFilesystem: true
allowPrivilegeEscalation: false
runAsNonRoot: true
capabilities:
  drop:
    - ALL
  add: {{ .Values.capabilities }}
{{- end -}}
{{- end }}