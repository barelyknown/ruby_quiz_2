module RubyQuiz2
  describe SelectionParty do

    let :people_list do
      PeopleList.new(File.read(File.expand_path("../../../fixtures/list.txt", __FILE__)))
    end

    subject do
      described_class.new people_list
    end

    it "sets the people list" do
      expect(subject.people_list).to eq people_list
    end

    it "has selections" do
      expect(subject.selections).to be_empty
    end

    it "can make selections" do
      subject.make_selections
    end

  end
end
