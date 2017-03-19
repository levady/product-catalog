worker_processes Integer(ENV["WEB_CONCURRENCY"] || 3)
timeout 27
preload_app true
listen ENV['PORT'], backlog: Integer(ENV['UNICORN_BACKLOG'] || 200)

before_fork do |server, worker|
  Signal.trap 'TERM' do
    puts 'Unicorn master intercepting TERM and sending QUIT instead'
    Process.kill 'QUIT', Process.pid
  end

  defined?(ActiveRecord::Base) and ActiveRecord::Base.connection.disconnect!
end

after_fork do |server, worker|
  Signal.trap 'TERM' do
    puts 'Unicorn worker intercepting TERM and doing nothing. Wait for master to sent QUIT'
  end

  if defined?(ActiveRecord::Base)
    config = ActiveRecord::Base.configurations[Rails.env] || Rails.application.config.database_configuration[Rails.env]
    config['reaping_frequency'] = ENV['DB_REAP_FREQ'] || 5 # seconds
    config['pool']            =   ENV['DB_POOL'] || 2
    ActiveRecord::Base.establish_connection(config)
    Rails.logger.warn("Connection pool size for Unicorn Server is now: #{ActiveRecord::Base.connection.pool.instance_variable_get('@size')}")
  end
end
