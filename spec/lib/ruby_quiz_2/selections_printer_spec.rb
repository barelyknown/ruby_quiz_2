module RubyQuiz2
  describe SelectionsPrinter do

    let :p1 do
      Person.new "Luke Skywalker", "luke@theforce.net"
    end

    let :p2 do
      Person.new "Toula Portokalos", "toula@manhunter.org"
    end

    let :selections do
      [
        Selection.new(p1, p2),
        Selection.new(p2, p1)
      ]
    end

    it "prints the selections" do
      # expect{subject.print(selections)}
    end

  end
end
