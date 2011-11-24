class GuessesController < ApplicationController
  
  def new
    @known_letters, @dashes = get_pieces_of_app_name
    @guess = Guess.new
  end
  
  def create
    @guess = Guess.new(params[:guess])
    if @guess.save
      redirect_to '/'
    else
      @known_letters, @dashes = get_pieces_of_app_name
      render 'new'
    end
  end

  private

  def get_pieces_of_app_name
    app = App.find :first
    known_letters = app.name[0..app.current_letter_position-1]
    num_unknown = app.name.length - known_letters.length
    dashes = '_' * num_unknown
    return known_letters, dashes
  end

end
