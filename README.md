### Backend
- Install ruby 2.3.3. It is recommended to use Ruby version manager like `rbenv` or `RVM`.
- Run `bundle`.
- Rename `database.yml.example` to `database.yml`.
- Run `bundle exec rake db:create`.
- Run `bundle exec rake db:migrate`.
- Run `bundle exec rake db:seed`.
- Run `bundle exec rails s`.

#### Frontend
- Install Node. If you're on OSX, using homebrew is recommended.
- Install NPM. If you're on OSX, using homebrew is recommended.
- Run `bundle exec rake ember:install`. It's going to take a while for the first time.

Go to `localhost:3000` to run the app.
