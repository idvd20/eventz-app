class RegistrationsController < ApplicationController

    before_action :set_event

    def index
        @registrations = @event.registrations
    end

    def new
        @registration = @event.registrations.new
    end

    def create
        @registration = @event.registrations.new(registrations_params)

        if @event.save
            redirect_to event_registrations_url(@event), notice: "Thanks for registering!"
        else
            render :new, status: :unprocessable_entity
        end
    end

    private

        def registrations_params
            params.require(:registration).permit(:name, :email, :how_heard)
        end

        def set_event
            @event = Event.find(params[:event_id])
        end
end
