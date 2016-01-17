module HtmlParserConcern
  def parse_doc doc
    content = doc.css("p, h1, h2, h3, h4, h5, h6")
    words  = []
    content.each do |paragraph|
      paragraph.text.split.each do |word|
        words.append word
      end
    end
    words
  end
end