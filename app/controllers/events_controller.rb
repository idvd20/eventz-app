class EventsController < ApplicationController

    def index
        @events = ["Bugsmash", "Hackathon", "Kata Camp", "Rails User Group"]
    end
end
