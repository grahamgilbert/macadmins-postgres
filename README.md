# MacAdmins Postgres Container

## Description

This is a postgres container for use with Sal, Crypt, etc. There are 3 variables that are exposed which the user may set.

## Obtaining the container

```bash
docker pull grahamgilbert/postgres:15.2
```

## Exposed variables

There are 3 exposed variables, see below for a full description:

- \$DB_NAME - Passes a string to the container as an environmental variable and creates a database with this value as its name.

- \$DB_USER - Passes a string to the container as an environmental variable and creates a role with this value as its name.

- \$DB_PASS - Passes a string to the container as an environmental variable and sets the role created with DB_USER to have this password.

### Important Note on Variable Values

Postgres will convert the strings to lower case when it creates the database and roles. Please ensure that you are passing lower case values here or you may have issues when you link other containers.

## Running the container

1. Create a directory to store the database outside of the docker container:

```bash
mkdir -p /some/dir/db
```

2. Run the docker container:

```bash
docker run -d --name"sal-db" \
-v /some/dir/db:/var/lib/postgresql/data \
-e DB_NAME="somename" \
-e DB_USER="username" \
-e DB_PASS="myPassw0rd" \
--restart="always" \
grahamgilbert/postgres:15.2
```

3. Ensure you wait 30 - 45 seconds for the container to initialize and create the Roles and Databases.

## Checking the Container Logs

You can check the status and logs of this and many other running containers with the following command:

```bash
docker logs <container name or ID>
```

Or in our case:

```bash
docker logs sal-test
```
