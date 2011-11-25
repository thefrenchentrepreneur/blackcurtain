class App < ActiveRecord::Base
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name, :presence => true,
                   :length => { :maximum => 20 }

  validates :email, :presence => true,
                    :format => { :with => email_regex },
                    :length => { :maximum => 30 }

  validates :current_letter_position, :numericality => { :only_integers => true },
                                      :length => { :maximum => 1 }
  
  def self.split_name
    app = find :first
    known_letters = app.name[0..app.current_letter_position-1]
    num_unknown = app.name.length - known_letters.length
    dashes = '_' * num_unknown
    return known_letters, dashes
  end
end
