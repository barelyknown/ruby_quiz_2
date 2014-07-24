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
      while selections.empty? && possible_selections.any?
        candidate_selections = possible_selections.shift
        if selection_rules.valid_set?(candidate_selections)
          self.selections.replace(candidate_selections)
        end
      end
      unless selections.any?
        raise ArgumentError, "there are no valid combinations of selections"
      end
    end

  private

    def valid_selections_by_santa
      @valid_selections_by_santa ||= begin
        Hash.new { |h,k| h[k] = [] }.tap do |h|
          people_list.each do |santa|
            people_list.people.shuffle.each do |giftee|
              if selection_rules.valid?(santa, giftee)
                h[santa] << Selection.new(santa, giftee)
              end
            end
          end
          unless h.length == people_list.length
            raise ArgumentError, "the rules give some people no options"
          end
        end
      end
    end

    def possible_selections
      @possible_selections ||= begin
        valid_selections_by_santa.shift[1].product(*valid_selections_by_santa.values)
      end
    end

  end
end
