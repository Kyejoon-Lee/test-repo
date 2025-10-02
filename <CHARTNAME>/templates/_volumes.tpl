{{/*
Available Persistent Volume CSI
*/}}
{{- define "volumes.pv.csi" -}}
{{- $type := .context.type -}}
{{- $filestoreInstance := .context.filestoreInstance | default "lunit-common-ssd" -}}
{{- if eq $type "filestore" -}}
{{- if and (eq $filestoreInstance "lunit-common-ssd") (.clusterTier) -}}
csi:
  driver: filestore.csi.storage.gke.io
  volumeHandle: "modeInstance/asia-northeast3-c/{{ $filestoreInstance }}/filestore/{{ .clusterTier }}/{{ .context.path | replace "/" "" }}"
  volumeAttributes:
    ip: 10.193.0.66
    volume: filestore/{{ .clusterTier }}/{{ .context.path | replace "/" "" }}
{{/*
one-ai-stg Filestore
*/}}
{{- else if and (eq $filestoreInstance "one-ai-stg") -}}
csi:
  driver: filestore.csi.storage.gke.io
  volumeHandle: "modeInstance/asia-northeast3-c/{{ $filestoreInstance }}/filestore"
  volumeAttributes:
    ip: 10.193.7.18
    volume: filestore
{{- end }}
{{- end }}
{{- end }}
