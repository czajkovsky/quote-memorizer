class PagesController < ApplicationController

  def start
    redirect_to root_path if current_user
  end

end
