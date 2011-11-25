class GuessesController < ApplicationController
  before_filter :include_app_name
  
  def index
    @guesses = Guess.find :all
  end
  
  def new
    @guess = Guess.new
  end
  
  def create
    @guess = Guess.new params[:guess]
    if not Guess.email_exists(@guess.email) or Guess.validate(@guess)
      save(@guess)
    else
      @hide = 'hide'
      @notice = 'Sorry, you must wait until we reveal the next letter'
      render 'new'
    end
  end

  private

  def save(guess)
    if guess.save
      @hide = 'hide'
      @notice = "Thanks! We'll send you the link to the website when we launch."
      render 'new'
    else
      render 'new'
    end
  end

  def include_app_name
    @known_letters, @dashes = App.split_name
  end

end
