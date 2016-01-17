require 'open-uri'

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
      start_stream words
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

  def start_stream words
    words.each do |word|
      # placeholder for start of streaming
    end
  end
end


