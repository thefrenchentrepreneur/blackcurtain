class CharacterTally < ActiveRecord::Base
  belongs_to :app

  validates :app_id, :presence => true,
                     :numericality => { :only_integer => true }
  validates :character, :presence => true,
                        :length => { :maximum => 1 }
  validates :count, :presence => true,
                    :numericality => { :only_integer => true }
end
