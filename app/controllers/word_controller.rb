class WordController < ApplicationController
  include WordHelper
  before_action :authenticate_user!

  def initialize
    @text = Text.new
    @pusher_key = "#{ENV['PUSHER_KEY']}"
  end

  def stream
    @pause_enabled = "disabled"
    @channel_key = SecureRandom.hex(13)
    render layout: 'application'
  end

  def create
    @text.url = params[:text][:url]
    @text.speed = params[:text][:speed]
    @text.random_color = params[:text][:random_color]
    @text.channel = params[:text][:channel]
    if @text.validate
      begin
        stop_streaming! params[:text][:job_id]
        # start_streaming returns job id of the scheduler.
        # Should be used for resume/pause
        @job_id = start_streaming!(@text)
        @text.save
        flash.notice = "Pleasant reading."
      rescue Errno::ENOENT => e
        flash.alert = "Couldn't read your url, sory!"
      end
    else
      flash.alert = format_model_errors @text
    end
    @paused_enabled = "enabled"
    @channel_key = @text.channel
    render layout: 'application', template: 'word/stream'
  end

  def pause
    pause_stream! params["jobId"]
    render :json => {}
  end

  def resume
    resume_stream! params["jobId"]
    render :json => {}
  end

end
