class App < ActiveRecord::Base
  validates :name, :presence => true
  validates :current_letter, :presence     => true,
                             :length       => { :maximum => 1 },
                             :numericality => { :only_integer => true}
end
