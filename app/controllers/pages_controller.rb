class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  
  def home
    @cocktails = Cocktail.all
    @cocktails_sample = [@cocktails.sample, @cocktails.sample, @cocktails.sample]
  end
end
