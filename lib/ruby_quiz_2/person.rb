module RubyQuiz2
  class Person

    attr_reader :name, :email

    def initialize(name, email)
      @name, @email = name, email
    end

    def family_name
      name.split(" ")[1]
    end

    def related_to?(person)
      family_name == person.family_name
    end

  end
end
