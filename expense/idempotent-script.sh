DATABASE_NAME=$1

dropdb $DATABASE_NAME
createdb $DATABASE_NAME

psql $DATABASE_NAME -f schema.sql