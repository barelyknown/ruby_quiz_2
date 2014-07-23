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

      # build an array of valid giftees for each santa
      valid_selections_by_santa = Hash.new { |h,k| h[k] = [] }
      people_list.each do |santa|
        people_list.people.shuffle.each do |giftee|
          if selection_rules.valid?(santa, giftee)
            valid_selections_by_santa[santa] << Selection.new(santa, giftee)
          end
        end
      end

      raise ArgumentError, "some people have no potential" unless valid_selections_by_santa.length == people_list.length

      possible_selections = valid_selections_by_santa.shift[1].product(*valid_selections_by_santa.values)

      while selections.empty? && possible_selections.any?
        candidate_selections = possible_selections.shift
        candidate_selections.each do |c|
        end
        if selection_rules.valid_set?(candidate_selections)
          self.selections.replace(candidate_selections)
        end
      end

      raise ArgumentError, "no feasible sets" unless selections.any?

      puts "Santa\tGiftee"
      selections.each do |selection|
        puts "#{selection.santa.name}\t#{selection.giftee.name}"
      end
    end
  end
end
