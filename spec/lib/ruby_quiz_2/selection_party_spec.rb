module RubyQuiz2
  describe SelectionParty do

    subject do
      described_class.new people_list
    end

    context "with a feasible people list" do
      let :people_list do
        PeopleList.new(File.read(File.expand_path("../../../fixtures/people_lists/feasible.txt", __FILE__)))
      end

      it "can make selections" do
        subject.make_selections
        expect(subject.selections.size).to eq people_list.length
      end
    end

    context "with an infeasible people list" do
      let :people_list do
        PeopleList.new(File.read(File.expand_path("../../../fixtures/people_lists/infeasible.txt", __FILE__)))
      end

      it "cannot make selections" do
        expect{subject.make_selections}.to raise_error ArgumentError
      end
    end

  end
end
