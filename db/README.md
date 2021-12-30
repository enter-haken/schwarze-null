# m database

![schema][1]

## requirements

* docker

## start the database for the first time

    $ make build run

After the container is built, you can start it by

    $ make start

# remarks

The database is still in development and may still change.
Currently the db volume is not set, so a 

    $ make all

or a

    $ make clean 

will delete all the data.

[1]: assets/schema.png
