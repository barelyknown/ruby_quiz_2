module RubyQuiz2
  class Selection

    attr_reader :santa, :giftee

    def initialize(santa, giftee)
      @santa, @giftee = santa, giftee
    end

  end
end
