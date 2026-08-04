{{- define "local-config" -}}

{
{{- range $key, $value := .Values.config }}
"{{ include "enketo.camelToSpace" $key }}": {{ toPrettyJson $value }},
{{- end }}
}
{{- end -}}