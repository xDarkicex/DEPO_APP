#---
# Excerpted from "Agile Web Development with Rails",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/rails4 for more book information.
#---
class StoreController < ApplicationController
  skip_before_action :authorize

  def increment_counter
    if session[:counter].nil?
      session[:counter] = 0
    end
    session[:counter] +=1
  end

  def index
    @products = Product.order(:title)
    @time = Time.now
    @count = increment_counter
    @display_count = "<div>This is your #{@count} at #{@time}</div>".html_safe
  end
end
