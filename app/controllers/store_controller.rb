class StoreController < ApplicationController
    skip_before_action :authorize

    include CurrentCart
    before_action :set_cart
    def index

      if params[:set_locale]
        redirect_to store_url(locale: params[:set_locale])
      else
      	@products = Product.order(:title)

      end
def increment_counter
      	if session[:counter].nil?

      		@visit = 1

      	else
      		@visit = session[:counter]+1

      	end

      	session[:counter] = @visit
    end
    @time = Time.now
    @count = increment_counter
    @display_count = "<div>This is your #{@count} at #{@time}</div>".html_safe
  end

end
