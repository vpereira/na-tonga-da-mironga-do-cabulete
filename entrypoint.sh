#!/bin/bash
set -x
cd /tiw
rake.ruby2.2 ar:create
rake.ruby2.2 ar:migrate
bin/padrino s -h "0.0.0.0" -p 3000
