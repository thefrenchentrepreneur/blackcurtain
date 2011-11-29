class Guess < ActiveRecord::Base
  belongs_to :app

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates :character, :presence => true,
                     :length => { :maximum => 1 }

  validates :email, :presence => true,
                    :format => { :with => email_regex },
                    :length => { :maximum => 30 }

  def check_guess
    app = App.first
    self.correct = app.name[app.current_character_position] == self.character
  end
end
