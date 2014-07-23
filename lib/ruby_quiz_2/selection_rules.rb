module RubyQuiz2
  class SelectionRules

    def valid?(santa, giftee)
      return false if santa == giftee
      return false if santa.related_to?(giftee)
      true
    end

    def valid_set?(selections)
      return false unless selections.collect(&:giftee).uniq.size == selections.size
      true
    end

  end
end
