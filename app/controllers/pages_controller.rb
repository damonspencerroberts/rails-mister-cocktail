class PagesController < ApplicationController
  def home
    @cocktails = Cocktail.all
    @cocktails_sample = [@cocktails.sample, @cocktails.sample, @cocktails.sample]
  end
end
