# Enketo

## Introduction

This chart bootstraps an [enketo-express](https://github.com/enketo/enketo-express) deployment on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

## Account branding

The optional `accountLib` value contains a CommonJS module exporting
`getAccount(serverUrl, accountApiUrl)`. When set, the chart mounts it as
`/srv/src/enketo/packages/enketo-express/config/account-branding.cjs` and writes
`accountBranding` to `account-branding.json` in the same directory. Changes to
either value trigger a pod rollout. Both values default to empty, so existing
releases keep their current behavior.

The provider defines the schema of `accountBranding`. The chart serializes that
value as JSON without interpreting its fields. Use absolute paths for imports
in the provider because Kubernetes mounts Secret entries through symlinks.

Enable the module in the existing `settingsConfig`:

```json
{
  "account lib": "/srv/src/enketo/packages/enketo-express/config/account-branding.cjs"
}
```

Enketo tries `linked form and data server` before the custom account provider.
An empty linked-server URL matches everything and bypasses the provider. A
nonmatching expression such as `(?!)` delegates all account resolution to the
provider, which must then supply the account key, linked server, and quota.
Enabling `account lib` also enables Enketo's existing quota-counting queries.
