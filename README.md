# reading-helper
Web application which helps users read faster by streaming words one by one.
# setup
To set up the application, after cloning the repository, first run _bundle install_ to download all dependencies.

Next, set up set up the following applications to help with words streaming:
 * https://github.com/dpavkov/word-painter
 * https://github.com/dpavkov/word-painter-socket-caller

You will need to set up the following environment variables:
 * WORD_PAINTER_URL - URL of word painter application
 * PUSHER_KEY - key for pusher server: https://pusher.com/websockets
 * READING-HELPER_DATABASE_PASSWORD - db password, in case you mean to run it in production

Create reading-helper_development postgres database, running on standard port. (You are free, of course, to use any db you wish, just set change the config in config/database.yml)

Run _rake db:migrate_

Run _rails server -e development_
# testing the application

Run _rake_ to run tests.