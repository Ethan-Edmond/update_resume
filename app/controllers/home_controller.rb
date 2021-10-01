ResumeHash = { :title => 'No title found',
              :skills => {
                :frontend => ['HTML', 'CSS', 'Javascript', 'React', 'Redux', 'LESS', 'Jest', 'React Testing Library', 'Styled Components', 'Ant Design'],
                :backend => ['Node.js', 'Express', 'Knex', 'SQL', 'PostgreSQL', 'SQLite', 'Python', 'Supertest']
              },
              :projects => [{:title => 'Human Rights First - Blue Witness'}, {:title => 'Potluck Planner'}],
              :experience => [{:title => 'Window Washer', :company => 'Sparklean'}, {:title => 'Semi-Truck Driver (CDL)', :company => 'C.R. England'}],
              :education => [{:school => 'Lambda School'}, {:school => 'Pikes Peak Community College'}]
             }


class HomeController < ApplicationController
  def index
    
  end
  def pdf
    unless params[:title] == ""
      ResumeHash[:title] = params[:title]
    end
    resume_file = File.open('resume_template_mine.tex.erb')
    resume = ERB.new(resume_file.read).result
    resume_file.close
    File.write('tmp/resume.tex', resume)
    system 'pdflatex -output-directory tmp tmp/resume.tex'
    send_file('tmp/resume.pdf', :filename => 'resume.pdf', :disposition => 'inline', :type => 'application/pdf')
  end
end
