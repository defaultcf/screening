# プロジェクトのルート
rails_root = ENV['RAILS_ROOT'] || File.expand_path('../../', __FILE__)
if ENV['RAILS_ENV'] == 'development' # for pry
  worker_processes 1
else
  worker_processes ENV['UNICORN_WORKER_PROCESSES'].to_i > 0 ? ENV['UNICORN_WORKER_PROCESSES'].to_i : 2
  preload_app true # Unicornの再起動時にダウンタイムなしで再起動
  stderr_path "#{rails_root}/log/unicorn_stderr.log"
  stdout_path "#{rails_root}/log/unicorn_stdout.log"
  pid "#{rails_root}/tmp/pids/unicorn.pid"
end
working_directory rails_root
timeout 300
# listen 3000
listen "#{rails_root}/tmp/sockets/unicorn.sock"
before_fork do |server, worker|
  ApplicationRecord.connection.disconnect! if defined?(ApplicationRecord) && ApplicationRecord.connected?
  old_pid = "#{server.config[:pid]}.oldbin"
  if old_pid != server.pid
    begin
      # USR2シグナルを受けると古いプロセスを止める
      sig = (worker.nr + 1) >= server.worker_processes ? :QUIT : :TTOU
      Process.kill(sig, File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH
    end
  end
end
after_fork do |_server, _worker|
  ApplicationRecord.establish_connection if defined?(ApplicationRecord)
end
