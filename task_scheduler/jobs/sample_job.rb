# # :first_in sets how long it takes before the job is first run. In this case, it is run immediately
# SCHEDULER.at '0s', :first_in => 0 do |job|
#   send_event('station1', {text1: "Tyre Change", time: "09:00", text2:"Car Health Check", time2: "10:00", text3:"Service", time3:"11:00", text4: "Tea Break", time4: "12:00", text5: "Service", time5: "13:00", text6: "Gearbox Replacement", time6: "14:00"})
# end
# SCHEDULER.at '15s', :first_in => 15 do |job|
#   send_event('station1', { text1: "Car Health Check", time: "10:00", text2:"Service", time2: "11:00", text3:"Tea Break", time3:"12:00", text4: "Service", time4: "13:00", text5: "Gearbox Replacement", time5: "14:00", text6: "New Task", time6: "15:00"})
# end
#   SCHEDULER.at '23s', :first_in => 23 do |job|
#     send_event('station1', {text1: "Service", time: "11:00", text2:"Tea Break", time2: "12:00", text3:"Service", time3:"13:00", text4: "Gearbox Replacement", time4: "14:00", text5: "New Task", time5: "15:00", text6: "", time6: "16:00"})
# end
# SCHEDULER.at '31s', :first_in => 31 do |job|
#   send_event('station1', {text1: "Tea Break", time: "12:00", text2:"Service", time2: "13:00", text3:"Gearbox Replacement", time3:"14:00", text4: "New Task", time4: "15:00", text5: "", time5: "16:00", text6: "", time6: "17:00"})
# end
# SCHEDULER.at '40s', :first_in => 40 do |job|
#   send_event('station1', {text1: "Service", time: "13:00", text2:"Gearbox Replacement", time2: "14:00", text3:"New Task", time3:"15:00", text4: "", time4: "16:00", text5: "", time5: "17:00", text6: "", time6: "18:00"})
# end
# SCHEDULER.at '48s', :first_in => 48 do |job|
#   send_event('station1', {text1: "Gearbox Replacement", time: "14:00", text2:"New Task", time2: "15:00", text3:"", time3:"16:00", text4: "", time4: "17:00", text5: "", time5: "18:00", text6: "", time6: "19:00"})
# end
# SCHEDULER.every '10s', :first_in => 0 do |job|
#   send_event('station2', { text3: "Cleaning"})
# end
