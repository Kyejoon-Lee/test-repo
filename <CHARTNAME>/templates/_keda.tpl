{{/*
Keda
scaleTargetRef
*/}}
{{- define "keda.scaleTargetRef" -}}
name: {{ template "fullname" $ }}
{{- if .Values.kedaAutoscaling.scaleTargetRef }}
apiVersion: {{ .Values.kedaAutoscaling.scaleTargetRef.apiVersion }}
kind: {{ .Values.kedaAutoscaling.scaleTargetRef.kind }}
envSourceContainerName: {{ .Values.kedaAutoscaling.scaleTargetRef.envSourceContainerName | default "" }}
{{- else }}
apiVersion: apps/v1
kind: Deployment
{{- end }}
{{- end }}
