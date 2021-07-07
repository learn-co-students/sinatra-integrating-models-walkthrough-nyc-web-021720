require_relative 'config/environment'
require_relative 'models/text_analyzer.rb'

class App < Sinatra::Base
  get '/' do
    erb :index
  end

  post '/' do
    # instead of this
    # text_from_user = params[:user_text]

    # can use this and we can call it and its methods from the results.erb view
    # params[:user_text] - from the '/:user_text'
    @analyzed_text = TextAnalyzer.new(params[:user_text])

    erb :results
  end
end
