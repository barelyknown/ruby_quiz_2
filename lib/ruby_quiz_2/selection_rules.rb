module RubyQuiz2
  class SelectionRules

    def valid?(santa, giftee)
      return false if santa == giftee
      return false if santa.related_to?(giftee)
      true
    end

  end
end
