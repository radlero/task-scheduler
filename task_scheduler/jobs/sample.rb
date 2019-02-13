require 'net/http'
require 'json'
require 'open-uri'
require 'pry'

# getting data from api endpoint (taskboard app)
def get_data
  uri = URI("https://taskboardv2.herokuapp.com/station1.json")
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  response = http.request(Net::HTTP::Get.new(uri.request_uri))
  JSON.parse(response.body)
end
def get_data2
  uri = URI("https://taskboardv2.herokuapp.com/station2.json")
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  response = http.request(Net::HTTP::Get.new(uri.request_uri))
  JSON.parse(response.body)
end
# schedule task and refresh the page every 5 seconds
SCHEDULER.every "5s", :first_in => 0 do |job|



stations1 = get_data
stations2 = get_data2


timeslots1 = ["08:00", "09:00", "10:00", "11:00", "12:00", "13:00", "14:00", "15:00", "16:00", "17:00"]
timeslots2 = ["08:00", "09:00", "10:00", "11:00", "12:00", "13:00", "14:00", "15:00", "16:00", "17:00"]

items = stations1["tasks"].each do |station|
    time = timeslots1.shift
    station[:time] = time
end
items2 = stations2["tasks"].each do |station|
    time = timeslots2.shift
    station[:time] = time
end
# map over tasks and create a items array
# items = stations1["tasks"].map{ |a|  {task: a["task"], time: a["time"], station: a["station"], importance: a["importance"], make: a["make"], regnum: a["regnum"]}}
# items2 = stations2["tasks"].map{ |a|  {task: a["task"], time: a["time"], station: a["station"], importance: a["importance"], make: a["make"], regnum: a["regnum"]}}

# display items in the terminal for controlling purpose

pp items
# send data to the event listeners (station windows) sorted by time    change "station"to :station for app1
# send_event("station1", {items: items.select { |b| b[:station] == "station1"}})
# send_event("station2", {items: items2.select { |b| b[:station] == "station2"}})
  send_event("station1", {items: items.select { |b| b["station"] == "station1"}.sort_by{ |b| b[:time]}})
  send_event("station2", {items: items2.select { |b| b["station"] == "station2"}.sort_by{ |b| b[:time]}})
  end
