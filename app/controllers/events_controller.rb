class EventsController < ApplicationController  
  def index
    @events = Event.limit(10)
    @event = Event.new

    respond_to do |format|
      format.html
      format.csv do
        require 'csv'
        send_data(CSV.generate do |csv|
          csv << ["Start", "Finished", "Duration (sec)", "Tags", "Created", "Updated"]
          @events.each do |event|
            csv << [event.started_at.to_s(:csv), event.finished_at.to_s(:csv), (event.finished_at - event.started_at).round(2),
             event.tag_list, event.created_at.to_s(:csv), event.updated_at.to_s(:csv)]
          end
        end)
      end
    end
  end

  def create
    @event = Event.new(params[:event].merge(:finished_at => Time.zone.now))
    
    if @event.save
      @events = Event.limit(10)
      @event = Event.new
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    @events = Event.limit(10)
  end
end
