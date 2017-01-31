#!/bin/bash
set -x
cd /tiw
# wait until db really started (not just container but service as well)
while ! timeout 1 bash -c 'cat < /dev/null > /dev/tcp/db/5432' >/dev/null 2>/dev/null; do sleep 0.1; done
rake.ruby2.2 ar:create
rake.ruby2.2 ar:migrate
bin/padrino s -h "0.0.0.0" -p 3000
