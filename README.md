# Hanami DB Provider Example

This app will raise an error because the `Parent` slice does not have a db configuration. To reproduce 

1. clone this repo
2. spin up the postgres server with `docker-compose up -d`
3. open a hanami console with `hanami c`
4. run `parent.boot`
