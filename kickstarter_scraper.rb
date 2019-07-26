# require libraries/modules here

require "nokogiri"
require "pry"

def create_project_hash
  # write your code here

  html = File.read('fixtures/kickstarter.html')
  kickstarter = Nokogiri::HTML(html)

  projects = {}

  kickstarter.css("li.project.grid_4").each do |project|
    title = project.css("h2.bbcard_name").text # Since li.project.grid_4 == a project, we do not need to include it in the css call here
    projects[title.to_sym] = {
      :image_link => project.css("img.projectphoto-little").attribute("src").value,
      :description => project.css("p.bbcard_blurb").text.strip,
      :location => project.css("span.location-name").text.strip,
      :percent_funded => project.css("i.first strong").text.gsub("%","").to_i
    }
  end
  # binding.pry
  projects
end

# kickstarter.css("li.project.grid_4").first
# kickstarter.css("li.project.grid_4 h2.bbcard_name")
# kickstarter.css("li.project.grid_4 h2.bbcard_name").first.text.strip
# kickstarter.css("li.project.grid_4 p.bbcard_blurb").first.text.strip
# kickstarter.css("li.project.grid_4 img.projectphoto-little").attribute("src").value
# kickstarter.css("li.project.grid_4 span.location-name").first.text.strip
# kickstarter.css("li.project.grid_4 li.first strong").first.text.strip
# binding.pry
