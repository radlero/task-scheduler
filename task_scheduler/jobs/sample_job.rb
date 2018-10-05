# :first_in sets how long it takes before the job is first run. In this case, it is run immediately
SCHEDULER.every '3s', :first_in => 0 do |job|
  send_event('station1', { text: "Car Service", text2: "Tea Break", text3: "" })
end
SCHEDULER.every '1m', :first_in => 0 do |job|
  send_event('station2', { text: "Tyre Change" })
end
  SCHEDULER.every '7s', :first_in => 0 do |job|
    send_event('station1', { text: "HAAHA it is working", text2: "Tea Break", text3: "New Task"})
end
