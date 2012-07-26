function start_mysql
  /usr/local/bin/mysql.server start
end

function stop_mysql
  /usr/local/bin/mysql.server
end

function start_pg
  /usr/local/bin/pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start
end

function stop_pg
  /usr/local/bin/pg_ctl -D /usr/local/var/postgres stop -s -m fast
end

function be
  bundle exec $argv
end

function brake
  bundle exec rake $argv
end

function rc
  bundle exec rails c
end

function rs
  bundle exec rails s
end

function rg
  bundle exec rails g $argv
end

function ci
  bundle exec rake ci
end

function reload
  . ~/.config/fish/config.fish
end
