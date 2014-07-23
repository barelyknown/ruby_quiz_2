module RubyQuiz2
  describe SelectionRules do

    it "does not let a person be their own santa" do
      p1 = double(Person)
      p2 = double(Person)
      expect(p1).to receive(:==).with(p2).and_return(true)
      expect(subject.valid?(p1, p2)).to eq false
    end

    it "does not let a family members select each other" do
      santa = double(Person)
      giftee = double(Person)
      expect(santa).to receive(:related_to?).with(giftee).and_return(true)
      expect(subject.valid?(santa, giftee)).to eq false
    end

  end
end
