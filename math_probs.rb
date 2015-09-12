require 'bundler'
require 'sinatra'
require 'tilt/haml'

require './math_stuff'

class MathProbs < Sinatra::Base

  # actions

  get '/' do
    haml :index, :locals => { :math_problems => MathStuff.format_math_problems }
  end

  get '/math-probs.css' do
    sass :index
  end

end