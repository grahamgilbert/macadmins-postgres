#!/bin/bash
set -eo pipefail

host="$(hostname --ip-address || echo '127.0.0.1')"
user="${DB_USER:-admin}"
db="${DB_NAME:-$DB_USER}"
export PGPASSWORD="${DB_PASS:-}"

args=(
    # force postgres to not use the local unix socket (test "external" connectibility)
    --host "$host"
    --username "$user"
    --dbname "$db"
    --quiet --no-align --tuples-only
)

if select="$(echo 'SELECT 1' | psql "${args[@]}")" && [ "$select" = '1' ]; then
    exit 0
fi

exit 1
