require 'open-uri'
require 'rufus/scheduler'
require 'rest-client'

module WordHelper

  def self.included klass
    klass.class_eval do
      include HtmlParserConcern
    end
  end

  def format_model_errors model
    alert = ""
    if model.errors
      errors = model.errors
      errors.keys.each do |field|

        alert += "<p>" + field.to_s + "</p>"
        alert += " <ul> "
        errors[field].each do |error|
          alert += " <li> "
          alert += error
          alert += " </li> "
        end
        alert += " </ul> "
      end
    end
    alert
  end

  def start_streaming! text, channel_key
    doc = Nokogiri::HTML(open(text.url))
    words = parse_doc doc
    schedule_stream!(words, text.speed, text.random_color == "1", channel_key)
  end

  def pause_stream! job_id
    get_job(job_id).pause
  end

  def resume_stream! job_id
    get_job(job_id).resume
  end

  def stop_streaming! job_id
    job = get_job(job_id)
    if job
      stop_job job
    end
  end

  private

  # scheduler.every (and so schedule_stream! as well) return job instance,
  # which later can be used to identify the job
  def schedule_stream!(words, seconds, color, channel)
    index = 0
    scheduler = Rufus::Scheduler.singleton
    scheduler.every seconds, allow_overlapping: false do |job|
      if index >= words.size
        stop_job job
      else
        send_word(words[index], color, channel, index == words.size - 1)
        index += 1;
      end
    end
  end

  def send_word(word, color, channel, is_last)
    word_painter_url = "#{ENV['WORD_PAINTER_URL']}/paint"
    RestClient.post word_painter_url, {'word' => word, 'random_color' => color, 'channel' => channel, 'last' => is_last}.to_json, :content_type => :json, :accept => :json
  end

  def get_job job_id
    scheduler = Rufus::Scheduler.singleton
    scheduler.job(job_id)
  end

  def stop_job job
    job.unschedule
    job.kill
  end

end


