every 1.months, :at => '0:05' do
  runner "TopStory.deleteExeptCurrent"
end


every 1.days, :at => '12:00' do
  runner "TopStory.copyRSSIntoDatabase"
  runner "TopStory.insertThemeIntoTopStoryDatabase"
end

every 4.minutes do
  runner "TopStory.deleteExeptCurrent" 
end
