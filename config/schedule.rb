every 30.day, :at => '0:05am' do 
  runner "TopStory.deleteExeptCurrent"
end