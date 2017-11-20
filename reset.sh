bundle exec rake environment db:drop db:create db:migrate
bundle exec annotate
bundle exec rake db:seed
bundle exec rake scrape:countries

bundle exec bin/rails db:migrate RAILS_ENV=test
