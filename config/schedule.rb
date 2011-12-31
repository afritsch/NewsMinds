#every @monthly do
#  runner "TopStory.deleteExeptCurrent"
#end


#every @daily, :at => '12:00 am' do
#  runner ""
#end


every 2.minutes do
  runner "TopStory.copyRSSIntoDatabase"
end
