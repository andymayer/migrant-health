# Migrant Health

## Installation set up

Standard rails app, uses `.env` for environment variables, so create one of those if required

## Local Development

### Pre-requisites

 * Ruby 2.4.2
 * Bundler
 * Postgres (Postgress.app is fine on the Mac)

After checking the project out, run ```bundle``` in the project directory to install the required Gems.

### Create and migrate database

Use the usual rake commands,

```rake db:create db:migrate```

### Optional seeding of database

Some example resources are set up in ```seeds.rb```

Run ```rake db:seed``` to populate the database.

### Resetting the database on development

The ```reset.sh``` file will drop the database, recreate, migrate, and seed.

## Yucky code or Technical Debt

As usual with prototypes, some code isn't as neat as it could be - feel free to annotate with #YUCK for future fixing.


 ## Deployment

Heroku is supported and indeed, the ```Procfile``` and config has been optimised for Heroku and Puma deployment.

### Resetting the database on production

The ```PROD-heroku-reset.sh``` file will drop the heroku database, run migrations against a fresh one and seed the database. USE WITH CAUTION!

## Search

This is currently set up to use the [pg_search gem](
https://github.com/Casecommons/pg_search). If you run ```rake db:seed``` to populate the database, then the indexes for search get recreated automatically.

Currently multisearch is only enabled on the ```Resource``` model. To rebuild the index, you can run ```rake pg_search:multisearch:rebuild[Resource]```

To delete the search index, you can use: ```PgSearch::Document.delete_all```

Search is currently using Postgres's inbuilt TSearch function, with part words enabled. You can change the settings in the ```config/initializers/pg_search.rb``` file.

## Topics

Functionality is provided by the ```acts-taggable-on``` gem with the front end magic select box provided by [Select2](https://select2.org/).

WIP - Set up tag/topics so they have slugs for searching.
Then set up topics controller which uses that slug (converted back to topic name) to find the relevant resources.

Resource.tagged_with('topic name as string')

Show like search

Set up routes of course

## Attachments

For local development, set the required AWS environment variables in a ```.env``` file as follows:

```
S3_BUCKET_NAME=
AWS_ACCESS_KEY_ID=
AWS_SECRET_ACCESS_KEY=
AWS_REGION=
```

## Setting heroku environment variables

Install the heroku config plugin (using ```heroku plugins:install heroku-config```) if it isn't already installed, then if you run 
```
heroku config:push --remote heroku
```

it will push your ```.env``` file variables to heroku.
