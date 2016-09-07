class TermsController < ApplicationController

  def show
    request.session_options[:skip] = true
    response.headers['Cache-Control'] = 'public, max-age=3600, s-maxage=21600'
  end

end