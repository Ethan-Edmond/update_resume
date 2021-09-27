ResumeObj = Hash.new
class HomeController < ApplicationController
  def index
    
  end
  def pdf
    ResumeObj[:title] = params[:title]
    resume_file = File.open('resume_template_mine.tex.erb')
    resume = ERB.new(resume_file.read).result
    resume_file.close
    File.write('tmp/resume.tex', resume)
    system 'pdflatex -output-directory tmp tmp/resume.tex'
    send_file('tmp/resume.pdf', :filename => 'resume.pdf', :disposition => 'inline', :type => 'application/pdf')
  end
end
