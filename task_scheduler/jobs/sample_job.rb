# :first_in sets how long it takes before the job is first run. In this case, it is run immediately
SCHEDULER.every '3s', :first_in => 0 do |job|
  send_event('station1', { text: "1 ja pierdole" })
end
SCHEDULER.every '1m', :first_in => 0 do |job|
  send_event('station2', { text: "2 uda sie" })
end
  SCHEDULER.every '7s', :first_in => 0 do |job|
    send_event('station1', { text: "3 proba" })
end
