# frozen_string_literal: true

require 'action_view'

namespace :batch do
  desc 'Pause updates'
  task pause: :environment do
    pid_file = 'tmp/batch_pause.pid'
    File.open(pid_file, 'w') { |f| f.puts Process.pid }
    Raven.capture_message 'Updates paused.', level: 'warning'
  end

  desc 'Resume updates'
  task resume: :environment do
    pid_file = 'tmp/batch_pause.pid'
    File.delete pid_file if File.exist? pid_file
    Raven.capture_message 'Updates resumed.', level: 'warning'
  end
end
