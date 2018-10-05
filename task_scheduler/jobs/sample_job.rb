# :first_in sets how long it takes before the job is first run. In this case, it is run immediately
SCHEDULER.every '3s', :first_in => 0 do |job|
  send_event('station1', { text1: "Car Service", time: "14:00"})
end
SCHEDULER.every '10s', :first_in => 0 do |job|
  send_event('station2', { text1: "Tyre Change", text2: "" })
end
  SCHEDULER.every '7s', :first_in => 0 do |job|
    send_event('station1', { text2: "HAAHA it is working"})
end
SCHEDULER.every '20s', :first_in => 0 do |job|
  send_event('station2', { text1: "Tea Break", text2: "Tyre Change"})
end
