class DalyNews < ActiveRecord::Base
  def self.onlyThemes
    except(TopStory.last.id)
  end
end
