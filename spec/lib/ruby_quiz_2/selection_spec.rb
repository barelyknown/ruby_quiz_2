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
      before do
        allow_any_instance_of(SelectionRules).to receive(:valid?).with(santa, giftee).and_return(true)
      end

      it "sets the santa" do
        expect(subject.santa).to eq santa
      end

      it "sets the giftee" do
        expect(subject.giftee).to eq giftee
      end
    end

    context "when the santa and giftee are not valid for a selection" do
      before do
        expect_any_instance_of(SelectionRules).to receive(:valid?).with(santa, giftee).and_return(false)
      end
      it "should raise an argument error" do
        expect{subject}.to raise_error ArgumentError
      end
    end

  end
end
