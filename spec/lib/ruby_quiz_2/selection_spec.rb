module RubyQuiz2
  describe Selection do

    let :santa do
      double(Person)
    end

    let :giftee do
      double(Person)
    end

    subject do
      described_class.new santa, giftee
    end

    context "when the santa and giftee are valid for a selection" do
      it "sets the santa" do
        expect(subject.santa).to eq santa
      end

      it "sets the giftee" do
        expect(subject.giftee).to eq giftee
      end
    end

  end
end
