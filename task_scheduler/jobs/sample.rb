require 'net/http'
require 'json'
require 'open-uri'
require 'pry'

# getting data from api endpoint (taskboard app)
def get_data
  uri = URI("https://taskboardv2.herokuapp.com/tasks.json")
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  response = http.request(Net::HTTP::Get.new(uri.request_uri))
  JSON.parse(response.body)
end
# schedule task and refresh the page every 5 seconds
SCHEDULER.every "5s", :first_in => 0 do |job|



stations = get_data

timeslots = ["08:00", "09:00", "10:00", "11:00", "12:00", "13:00", "14:00", "15:00", "16:00", "17:00"]

items = stations["tasks"].each do |station|
    time = timeslots.shift
    station[:time] = time
end

# map over tasks and create a items array
# items = stations["tasks"].map{ |a|  {task: a["task"], time: a["time"], station: a["station"], importance: a["importance"], make: a["make"], regnum: a["regnum"]}}


# display items in the terminal for controlling purpose

pp items
# send data to the event listeners (station windows) sorted by time    change "station"to :station for app1
  send_event("station1", {items: items.select { |b| b["station"] == "station1"}.sort_by{ |b| b[:time]}})
  send_event("station2", {items: items.select { |b| b["station"] == "station2"}.sort_by{ |b| b[:time]}})
  end
