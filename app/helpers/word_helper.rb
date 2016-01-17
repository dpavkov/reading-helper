require 'open-uri'
require 'rufus/scheduler'

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

        alert += field.to_s
        alert += " <ul> "
        errors[field].each do |error|
          alert += " <li> "
          alert += error
          alert += " </li> "
        end
        alert +=  " </ul> "
      end
    end
    alert
  end

  def start_streaming!(text)
    doc = read_url text.url
    if !doc.nil?
      words = parse_doc doc
      schedule_stream(words, text.speed, text.random_color)
    end
  end

  private

  def read_url url
    begin
      return Nokogiri::HTML(open(url))
    rescue Errno::ENOENT => e
      return nil
    end
  end

  def schedule_stream(words, seconds, color)
    index = 0
    scheduler = Rufus::Scheduler.new
    scheduler.every seconds, allow_overlapping: false do
      if index >= words.size
        scheduler.stop(teminate: true)
      else
        index += 1;
        # placeholder for sending the next word
      end
    end

  end
end


