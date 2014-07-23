module RubyQuiz2
  class SelectionParty

    attr_reader :people_list, :attendees

    def initialize(people_list)
      @people_list = people_list
    end

    def selections
      @selections ||= []
    end

    def selection_rules
      @selection_rules ||= SelectionRules.new
    end

    def make_selections
      try = 0
      while selections.size != people_list.length
        try += 1
        puts "try #{try}"
        selections.clear
        santas, giftees = people_list.people.clone, people_list.people.clone
        santas.shuffle!
        giftees.shuffle!
        santas.each do |santa|
          giftee = giftees.find do |g|
            selection_rules.valid?(santa, g)
          end
          selections << Selection.new(santas.delete(santa), giftees.delete(giftee)) if giftee
        end
        puts selections.size
        puts
        break if try == 1
      end
      puts "Santa\tGiftee"
      selections.each do |selection|
        puts "#{selection.santa.name}\t#{selection.giftee.name}"
      end
      puts
      puts "Remaining Santas"
      santas.each do |santa|
        puts santa.name
      end
      puts
      puts "Remaining Giftees"
      giftees.each do |giftee|
        puts giftee.name
      end
    end
  end
end
