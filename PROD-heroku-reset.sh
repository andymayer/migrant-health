set -e

heroku pg:reset DATABASE --remote heroku

/usr/local/bin/heroku rake db:migrate --remote heroku
/usr/local/bin/heroku rake db:seed --remote heroku
