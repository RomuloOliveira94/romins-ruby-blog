class PagesController < ApplicationController

  def home
    Rails.logger.info("Home page accessed") do
      "Bem vindo ao romin blog!"
    end
  end

end
