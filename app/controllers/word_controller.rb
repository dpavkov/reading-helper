class WordController < ApplicationController
  include WordHelper
  before_action :authenticate_user!

  def initialize
    @text = Text.new
    @pusher_key = "#{ENV['PUSHER_KEY']}"
  end

  def stream
    render layout: 'application'
  end

  def create
    @text.url = params[:text][:url]
    @text.speed = params[:text][:speed]
    @text.random_color = params[:text][:random_color] == "1"
    @channel_key = SecureRandom.hex(13)
    if @text.validate
      begin
        stop_streaming! params[:text][:job_id]
        # start_streaming returns job id of the scheduler.
        # Should be used for resume/pause
        @job_id = start_streaming!(@text, @channel_key)
        @text.save
        flash.notice = "Pleasant reading."
        flash.alert = nil
      rescue Errno::ENOENT => e
        flash.alert = "Couldn't read your url, sory!"
        flash.notice = nil
      end
    else
      flash.alert = format_model_errors @text
      flash.notice = nil
    end
    @reset_channel = false
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
