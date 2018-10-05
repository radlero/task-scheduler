# :first_in sets how long it takes before the job is first run. In this case, it is run immediately
SCHEDULER.every '1s', :first_in => 0 do |job|
  send_event('station1', { text1: "Car Service", time: "9:00"})
end
SCHEDULER.every '1s', :first_in => 0 do |job|
  send_event('station2', { text1: "Tyre Change", text2: "" , time: "9:00"})
end
  SCHEDULER.every '1s', :first_in => 0 do |job|
    send_event('station1', { text2: "scheduling is working", time2: "10:00"})
end
SCHEDULER.every '20s', :first_in => 0 do |job|
  send_event('station2', { text1: "Tea Break", text2: "Tyre Change", time: "10:00"})
end
