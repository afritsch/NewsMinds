every @monthly do
  runner "TopStory.deleteExeptCurrent"
end


#every @daily, :at => '12:00 am' do
#  runner ""
#end


every 1.minute do
  runner "TopStory.copyRSSIntoDatabase"
end
