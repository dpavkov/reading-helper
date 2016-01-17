
class WordController < ApplicationController
  include WordHelper
  before_action :authenticate_user!

  def initialize
    @text = Text.new
  end

  def create
    @text.url = params[:text][:url]
    @text.speed = params[:text][:speed]
    @text.random_color = params[:text][:random_color]
    if @text.save
      flash.notice = "Pleasant reading"
    else
      flash.alert = format_model_errors @text
    end
    redirect_to '/word/stream'
  end

  def stream
    render layout: 'application'
  end


end
