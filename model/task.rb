class Task < LazyRecord
    attr_accessor :text,:stade
    def initialize(text)
        @text = text
        @stade = false
    end
    def complete!
        @stade =true
        save
    end
    def uncomplete!
        @stade =false
        save
    end
end