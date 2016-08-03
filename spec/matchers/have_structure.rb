require 'rspec/expectations'
require 'nokogiri'

RSpec::Matchers.define(:have_structure) do |expected|
  match do |actual|
    expect(normalized(actual)).to eq normalized(expected)
  end

  failure_message do |actual|
    "Expected\n\n#{actual}\n\n" \
      "to have the same structure as\n\n#{expected}"
  end

  failure_message_when_negated do |actual|
    "Expected\n\n#{actual}\n\n" \
      "to NOT have the same canonicalized structure as\n\n#{expected}"
  end

  def normalized(text)
    document = Nokogiri::XML("<snippet>#{text}</snippet>")
    document.traverse do |node|
      node.content = node.text.strip if node.text?
    end

    document.canonicalize do |node, parent|
      !(node.text? && node.text.empty?)
    end
  end
end
