module RubyQuiz2
  describe PeopleList do

    let :list do
      File.read(File.expand_path("../../../fixtures/list.txt", __FILE__))
    end

    context "when initialized with the list" do
      subject do
        described_class.new list
      end
      it "has the right number of people" do
        expect(subject.length).to eq 7
      end
    end

    it "has a people array" do
      expect(subject.people).to be_empty
    end

    it "implements enumerable" do
      expect(subject).to respond_to :each
    end

  end
end
