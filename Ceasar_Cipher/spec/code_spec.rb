require "code"

describe CeasarCypher do
  subject do
    CeasarCypher.new
  end

  describe "#get_text" do
    it 'turns input text to char array' do
      allow($stdin).to receive(:gets).and_return("45 Baker Str.\n")

      expect(subject.get_text $stdin.gets).to eql(['4','5',' ','B','a','k','e','r',' ','S','t','r','.'])
    end

    it 'turns empty input to empty array' do
      allow($stdin).to receive(:gets).and_return("\n")

      expect(subject.get_text $stdin.gets).to eql([])
    end
  end

  # Note: eql probably too complicated
  describe "#check_cypher" do
    it "returns a number in bounds of our alphabet length" do
      expect(subject.check_cypher 9999).to eql(9999 - (9999/subject.Max_shift).to_i * subject.Max_shift)
    end
    it "converts a negative number to be in bounds of our alphabet length" do
      expect(subject.check_cypher -9999).to eql(0 - 9999 + (9999/subject.Max_shift + 1).to_i * subject.Max_shift)
    end
  end

  describe "#cypher" do
    it "shifts all letters in it's alphabet" do
      expect(subject.cypher 'abczyx123987'.split(''),1).to eql('bcdazy234098')
    end
    it "doesn't change the message when shift is 0" do
      expect(subject.cypher 'abczyx123987'.split(''),0).to eql('abczyx123987')
    end
  end

end
