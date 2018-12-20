require 'net/http'
require 'json'
require 'open-uri'


def get_data
  uri = URI("https://taskboard-rl.herokuapp.com/tasks.json")
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  response = http.request(Net::HTTP::Get.new(uri.request_uri))
  JSON.parse(response.body)
end

SCHEDULER.every "5s", :first_in => 0 do |job|

stations = get_data

items = stations["tasks"].map{ |a|  {task: a["task"], time: a["time"], station: a["station"], importance: a["importance"], make: a["make"], regnum: a["regnum"]}}



pp items
  send_event("station1", {items: items.select { |b| b[:station] == "station1"}.sort_by{ |b| b[:time]}})
  send_event("station2", {items: items.select { |b| b[:station] == "station2"}.sort_by{ |b| b[:time]}})
  end
