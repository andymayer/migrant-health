set -e

heroku pg:reset DATABASE

/usr/local/bin/heroku rake db:migrate
/usr/local/bin/heroku rake db:seed
