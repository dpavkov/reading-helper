require 'rspec'

describe 'WordHelper', "#format_model_errors" do
  let(:word_helper_class) { Class.new { include WordHelper } }
  context "with messages in it" do
    it 'should format error messages' do
      text = Text.new
      alert = word_helper_class.new.format_model_errors text
      expect(alert).to eq ""
      text.errors[:url] = "can't be blank"
      alert = word_helper_class.new.format_model_errors text
      expect(alert).to include "<ul>"
    end
  end
end