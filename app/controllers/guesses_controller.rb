class GuessesController < ApplicationController
  before_filter :include_app, :include_app_name, :include_top_guesses
  
  def index
    # @guesses = Guess.find :all
    redirect_to '/'
  end
  
  def new
    @guess = Guess.new
  end
  
  def create
    @guess = @app.guesses.new(params[:guess])
    if not email_exists(@guess.email) or validate(@guess)
      save(@guess)
    else
      @hide = 'hide'
      @notice = 'Sorry, you must wait until we reveal the next letter'
      render 'new'
    end
  end

  private

  def save(guess)
    @guess.check_guess # check if user guessed correctly
    if guess.save
      @app.update_character_tally(guess.character)
      @hide = 'hide'
      @notice = "Thanks for participating, we'll send you the link to the website before we officially launch. If at least 4 of your guesses are correct, you'll be part of the limited group of private beta testers! Don't forget to come back next week and share with your friends."
      render 'new'
    else
      render 'new'
    end
  end

  def include_app
    @app = App.first
  end

  def include_app_name
    @known_characters, @letter, @dashes = @app.split_name
    @notice = "Wanna get early access to the next hot startup? Guess the name of my startup by submitting a letter every week."
    # @known_characters, @dashes = App.split_name(params[:hash])
  end

  def include_top_guesses
    @num_guesses = @app.guesses.count
    @top_guesses = @app.character_tallies.order('count desc').limit(3) 
    @top_guesses_percents = percents_of(@top_guesses)
    @top_guesses_heading = define_heading(@top_guesses.length)
  end

  def percents_of(top_guesses)
    percents = Array.new
    top_guesses.each do |g|
      percents << g.count.to_f / @num_guesses * 100
    end
    return percents
  end

  def define_heading(count)
    @top_guesses_heading = "#{@num_guesses} guesses so far, "
    if count > 1
      @top_guesses_heading += "the top #{@top_guesses.length } guesses are:"
    elsif count == 1
      @top_guesses_heading += "The top guess is"
    else
      @top_guesses_heading += "There are currently no guesses yet"
    end
  end
  
  def validate(guess)
    return true if not email_exists(guess.email)
    email_exists(guess.email) and not guessed_current_character(guess.email)
  end

  def email_exists(email)
    guess = latest_guess_by(email)
    not guess.nil?
  end
  
  def guessed_current_character(email)
    guess = latest_guess_by(email)
    guess.created_at > App.first.date_last_character_revealed
  end

  def latest_guess_by(email)
     Guess.where(:email => email)
          .order('created_at DESC')
          .first
  end

end
