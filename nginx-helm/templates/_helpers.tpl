{{- define "nginx-helm.name" -}}
nginx
{{- end -}}

{{- define "nginx-helm.fullname" -}}
{{ include "nginx-helm.name" . }}
{{- end -}}
