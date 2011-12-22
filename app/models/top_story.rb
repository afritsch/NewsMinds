class TopStory < ActiveRecord::Base
  def self.deleteExeptCurrent
    for i in 0...(count-1)
      first.destroy
    end
  end
  
  has_many :posts, :dependent => :destroy
end
