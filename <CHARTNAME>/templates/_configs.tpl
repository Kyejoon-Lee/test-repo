{{/*
Env From
*/}}
{{- define "configs.envFrom" -}}
{{- $context := . -}}
{{- range $ref := .Values.envFrom }}
  {{- range $key, $value := $ref }}
    {{- if and (eq $key "secretRef") ($.Values.configs.secret.create) (not (empty $.Values.configs.secret.data)) }}
- {{ $key }}:
    {{- tpl (toYaml $value) $context | nindent 4 }}
    {{- else if ne $key "secretRef" }}
- {{ $key }}:
    {{- tpl (toYaml $value) $context | nindent 4 }}
    {{- end }}
  {{- end }}
{{- end }}
{{- end }}
