require 'bundler'
require 'sinatra'
require './math_stuff'

class MathProbs < Sinatra::Base

  # actions

  get '/' do
    haml :index, :locals => { :math_problems => MathStuff.format_math_problems }
  end


end