class App < ActiveRecord::Base
  has_many :guesses

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name, :presence => true,
                   :length => { :maximum => 20 }

  validates :email, :presence => true,
                    :format => { :with => email_regex },
                    :length => { :maximum => 30 }

  validates :current_character_position, :numericality => { :only_integers => true },
                                      :length => { :maximum => 1 }
  
  def self.split_name(hash)
    app = find_by_hash(hash)
    if not app.nil?
      known_characters = app.name[0..app.current_character_position-1]
      num_unknown = app.name.length - known_characters.length
      dashes = '_' * num_unknown
      return known_characters, dashes
    end
  end
end
