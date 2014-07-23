module RubyQuiz2
  describe Person do

    let :name do
      "Luke Skywalker"
    end

    let :email do
      "luke@theforce.net"
    end

    let :related_person do

    end

    subject do
      described_class.new name, email
    end

    it "sets the name" do
      expect(subject.name).to eq name
    end

    it "sets the email" do
      expect(subject.email).to eq email
    end

    it "gets the family name" do
      expect(subject.family_name).to eq "Skywalker"
    end

    it "is in the same family as the other people with the same last name" do
      family_member = described_class.new "Leia Skywalker", "leia@therebellion.org"
      expect(subject.related_to?(family_member)).to eq true
    end

  end
end
