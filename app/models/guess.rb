class Guess < ActiveRecord::Base
  validates :email,  :presence => true
  validates :letter, :presence => true,
                     :length   => { :maximum => 1 }
end
