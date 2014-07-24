module RubyQuiz2
  class SelectionsPrinter

    def print(selections)
      puts
      puts "SECRET SANTA SELECTIONS"
      puts
      w = 25
      puts "Santa".ljust(w, " ") + " " + "Giftee"
      puts "-----".ljust(w, "-") + " " + "------".ljust(w, "-")
      selections.each do |selection|
        puts selection.santa.name.ljust(w, " ") + " " + selection.giftee.name
      end
      puts
    end

  end
end
