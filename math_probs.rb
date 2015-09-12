require 'bundler'

require 'byebug'

require 'sinatra'
require 'pdfkit'
require 'tilt/haml'
require 'tilt/sass'

require './math_stuff'

class MathProbs < Sinatra::Base

  get '/problems.?:format?' do
    count = Integer(params[:count]) rescue nil
    min = Integer(params[:min]) rescue nil
    max = Integer(params[:max]) rescue nil
    type = params[:type].to_s rescue nil

    problems = MathStuff.generate_math_problems(count, type, min, max)

    if params[:format].nil? || params[:format] == 'html'
      haml :index, :locals => { :math_problems => MathStuff.format_math_problems(problems) }
    elsif params[:format] == 'pdf'
      sheet = PDFKit.new(request.url.gsub(/\.pdf/, ''))
      status 200
      headers 'Content-Type' => 'application/pdf'
      body sheet.to_pdf
    else
      status 404
    end
  end

  get '/math-probs.css' do
    sass :index
  end

end