current_valuation = 0

Dashing.scheduler.every '2s' do
  Dashing.send_event('karma',   { text: rand(100) })
end
