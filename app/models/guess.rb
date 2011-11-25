class Guess < ActiveRecord::Base
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates :letter, :presence => true,
                     :length => { :maximum => 1 }

  validates :email, :presence => true,
                    :format => { :with => email_regex },
                    :length => { :maximum => 30 }

  def self.validate(guess)
    return true if not email_exists(guess.email)
    email_exists(guess.email) and not guessed_current_letter(guess.email)
  end

  def self.email_exists(email)
    guess = latest_guess_by(email)
    not guess.nil?
  end
  
  def self.guessed_current_letter(email)
    guess = latest_guess_by(email)
    guess.created_at > App.first.date_last_letter_released
  end

  def self.latest_guess_by(email)
     Guess.where(:email => email)
          .order('created_at DESC')
          .first
  end

end
