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

SCHEDULER.every "30s", :first_in => 0 do |job|

stations = get_data

# Send Data
  stations['tasks'].each do |task|
    data = {
      text2: task['task'],
      time2: task['time']
    }
    send_event(task['station'], data)
  end
end
