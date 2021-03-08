class SystemController < ApplicationController

  def info
    render json: {
      ruby_version: RUBY_VERSION,
      rails_version: Rails.version,
      git_revision: `git rev-parse HEAD`.strip,

      redis_channel: Rails.application.credentials[:redis][:channel],
      socket_io_uri: Rails.application.credentials[:redis][:socket_io_uri],

      time_string: Server.timer.calendar.time_string
    }
  end

end
