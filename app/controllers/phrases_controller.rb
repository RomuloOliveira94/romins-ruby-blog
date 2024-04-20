class PhrasesController < ApplicationController
  http_basic_authenticate_with name: "dhh", password: "123", except: [:index, :show]

  def index
    @phrases = Phrase.all
  end

  def show
    @phrase = Phrase.find(params[:id])
  end

  def new
    @phrase = Phrase.new
  end

  def create
    @phrase = Phrase.new(phrase_params)

    if @phrase.save
      redirect_to @phrase
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @phrase = Phrase.find(params[:id])
  end

  def update
    @phrase = Phrase.find(params[:id])

    if @phrase.update(phrase_params)
      redirect_to @phrase
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @phrase = Phrase.find(params[:id])
    @phrase.destroy

    redirect_to phrases_path, status: :see_other
  end

  private

  def phrase_params
    params.require(:phrase).permit(:title, :body, :status)
  end
end
