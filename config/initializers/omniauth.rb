# Copyright (C) <2012> <Bruenner Franz Josef, Fritsch Andreas>

Rails.application.config.middleware.use OmniAuth::Builder do  
  provider :facebook, '216123861800374', 'd108675f2598233033060845b559ce69' 
end

