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

    describe "#valid_set?" do
      it "does not multiple people to have the same giftee" do
        s1 = double(Person)
        s2 = double(Person)
        g1 = double(Person)
        sel1 = Selection.new(s1, g1)
        sel2 = Selection.new(s2, g1)
        expect(subject.valid_set?([sel1, sel2])).to eq false
      end
      it "is valid in the basic case" do
        p1 = double(Person)
        p2 = double(Person)
        sel1 = Selection.new(p1, p2)
        sel2 = Selection.new(p2, p1)
        expect(subject.valid_set?([sel1, sel2])).to eq true
      end
    end

  end
end
