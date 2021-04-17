{{- define "appNameWithBranch" -}}
{{- printf "%s-%s" .Values.app.name .Values.branch -}}
{{- end -}}
