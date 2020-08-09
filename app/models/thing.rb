class Thing < ApplicationRecord
    validates :name,presence: true,length:{maximum:50}
    validates :clean_day,presence: true
    validates :clean_frequency,presence: true,length:{maximum:3}
    validates :remarks,length:{maximum:200}
    validates :tool1,length:{maximum:30}
    validates :tool2,length:{maximum:30}
    validates :tool3,length:{maximum:30}
    validates :tool4,length:{maximum:30}
    validates :tool5,length:{maximum:30}
    
    belongs_to :place
    belongs_to :user
end
