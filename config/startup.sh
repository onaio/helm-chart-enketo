#!/bin/bash
npm prune --production
exec pm2-runtime start --output /dev/stdout app.js -n enketo
