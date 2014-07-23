module RubyQuiz2
  class PeopleList
    include Enumerable

    def initialize(list=nil)
      import list if list
    end

    def people
      @people ||= []
    end

    def length
      people.length
    end

    def each
      people.each { |person| yield person }
    end

  private

    def import(list)
      list.split("\n").each do |line|
        first_name, family_name, email = line.split(" ")
        name = [first_name, family_name].join(" ")
        email = email.gsub(/[<>]/, "")
        people << Person.new("#{first_name} #{family_name}", email)
      end
    end

  end
end
