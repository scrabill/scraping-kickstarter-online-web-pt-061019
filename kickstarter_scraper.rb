# require libraries/modules here

require "nokogiri"
require "pry"

def create_project_hash
  # write your code here

  html = File.read('fixtures/kickstarter.html')

  kickstarter = Nokogiri::HTML(html)
  kickstarter.css("li.project.grid_4").first
  kickstarter.css("li.project.grid_4 h2.bbcard_name")
  kickstarter.css("li.project.grid_4 h2.bbcard_name").first.text.strip
  kickstarter.css("li.project.grid_4 p.bbcard_blurb").first.text.strip
  kickstarter.css("li.project.grid_4 img.projectphoto-little").attribute("src").value
  kickstarter.css("li.project.grid_4 span.location-name").first.text.strip
  kickstarter.css("li.project.grid_4 li.first .funded").first.text.strip
  binding.pry
end
