require 'rubygems'
require 'bundler'
Bundler.require

class Application < Sinatra::Base
   
  get '/' do
    erb :front
  end
  
  get '/create_html' do
    @document = AsciiDoc::AsciiDocument.new(open("public/test.asciidoc").read)
    @document.render(:html, "templates/html_template", "public/results/html_template")
    redirect "results/html_template/index.html"
  end
  
  get '/create_pdf' do
    @document = AsciiDoc::AsciiDocument.new(open("public/test.asciidoc").read)
    @document.render(:pdf, "templates/html_template", "public/results/pdf_template")
    redirect "results/pdf_template/index.pdf"
  end
  
  get '/design' do 
    @folder = "/designtest/"
    erb :design
  end
  
  not_found do
    erb :notfound
  end
  
end



