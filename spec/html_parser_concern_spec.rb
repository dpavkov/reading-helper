require 'rspec'

describe 'HtmlParser', "#parse_doc" do
  let(:html_parser_class) { Class.new { include HtmlParserConcern } }
  context "with the p content" do
    doc = Nokogiri::HTML("<p>One two three</p>")
    let (:words) { html_parser_class.new.parse_doc doc }
    it 'should contain words from p' do
      expect(words.size).to eq 3
      expect(words).to include "One"
      expect(words).to include "two"
      expect(words).to include "three"
    end
  end
  context "with header content" do
    doc = Nokogiri::HTML("<h6>Four</h6><h1>One two three</h1>")
    let (:words) { html_parser_class.new.parse_doc doc }
    it "should contain words from header" do
      expect(words.size).to eq 4
      expect(words).to include "One"
      expect(words).to include "two"
      expect(words).to include "three"
      expect(words).to include "Four"
    end
    it "should maintain order of words" do
      expect(words[0]).to eq "Four"
      expect(words[1]).to eq "One"
      expect(words[2]).to eq "two"
      expect(words[3]).to eq "three"
    end
  end
end