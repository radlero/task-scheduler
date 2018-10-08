# :first_in sets how long it takes before the job is first run. In this case, it is run immediately
SCHEDULER.every '10s', :first_in => 20 do |job|
  send_event('station1', { text1: "Car Health Check", time: "10:00", text2:"Service", time2: "11:00", text3:"Tea Break", time3:"12:00"})

end
SCHEDULER.every '10s', :first_in => 0 do |job|
  send_event('station2', { text3: "Tco za gowno"})
end
