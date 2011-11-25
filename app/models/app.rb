class App < ActiveRecord::Base
  has_many :guesses
  has_many :character_tallies

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name, :presence => true,
                   :length => { :maximum => 20 }
  validates :email, :presence => true,
                    :format => { :with => email_regex },
                    :length => { :maximum => 30 }
  validates :current_character_position, :numericality => { :only_integers => true },
                                         :length => { :maximum => 1 }
  validates :num_guesses, :presence => true,
                          :numericality => { :only_integers => true }
  
  def split_name
    known_characters = self.name[0..self.current_character_position-1]
    num_unknown = self.name.length - known_characters.length
    dashes = '_' * num_unknown
    return known_characters, dashes
  end
  
  def update_character_tally(character)
    char_counter = character_tallies.find_by_character(character)
    if char_counter.nil?
      character_tallies.create(:character => character, :count => 1)
    else
      char_counter.count += 1
      char_counter.save
    end
  end

  def increment_num_guesses
    self.num_guesses += 1
    self.save
  end

end
