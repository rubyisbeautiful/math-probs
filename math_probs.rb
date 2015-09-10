require 'bundler'
require 'sinatra'

class MathProbs < Sinatra::Base
  get '/' do
    'Hello World'
  end
end