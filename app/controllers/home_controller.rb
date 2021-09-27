class HomeController < ApplicationController
  def index
    
  end
  def pdf
    # resume_file = File.open('resume_template_mine.tex.erb')
    # resume = ERB.new(resume_file.read).result
    # resume_file.close
    # print resume
    send_file('app/views/home/resume.pdf', :filename => 'resume.pdf', :disposition => 'inline', :type => 'application/pdf')
  end
end
