require "spec_helper"

RSpec.describe ChatoMud::Grammar::Parser do
  let!(:parser) { ChatoMud::Grammar::Parser.new }

  let(:queries) do
    JSON.parse(file_fixture("grammar/#{File.basename(__FILE__, '.rb')}.json").read)
  end

  describe ChatoMud::Grammar::Parser do
    context "look_at_on_another" do
      it "can parse" do
        queries.each do |query|
          expect(JSON.parse(parser.parse(query[0]).to_json)).to eq(query[1])
        end
      end
    end
  end
end
