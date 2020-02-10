#################### ProjectManger ####################
# Use this script to view and update project settings.

class String
def black;          "\e[30m#{self}\e[0m" end
def red;            "\e[31m#{self}\e[0m" end
def green;          "\e[32m#{self}\e[0m" end
def brown;          "\e[33m#{self}\e[0m" end
def blue;           "\e[34m#{self}\e[0m" end
def magenta;        "\e[35m#{self}\e[0m" end
def cyan;           "\e[36m#{self}\e[0m" end
def gray;           "\e[37m#{self}\e[0m" end
end

####################  AUTHORIZATION 
# Be sure to set your UID and SECRET from https://profile.intra.42.fr/oauth/applications
require "oauth2"
UID = "PutYoursHere"
SECRET = "PutYoursHere"
client = OAuth2::Client.new(UID, SECRET, site: "https://api.intra.42.fr")
token = client.client_credentials.get_token

####################  Set this to the projectID of the project you wish to work with. As an admin you can see this number from the project's page.
projectID = "1670"

#################### Uncomment this to GET information about a project.

# response = token.get("/v2/projects/" + projectID)
# response.status
# puts response.parsed
# # => [{"id"=>6, "coordinates"=>[73.0, 53.0], "by"=>[], "kind"=>"project", "project_session_id"=>3}, {"id"=>4, "coordinates"=>[63.0, 81.0], "by"=>[], "kind"=>"exam", "project_session_id"=>2}, {"id"=>5, "coordinates"=>[80.0, 76.0], "by"=>[], "kind"=>"exam", "project_session_id"=>2}]


#################### Uncomment this to UPDATE information about a project using PUT.

## For a list of project settings you can change via the API, go to https://api.intra.42.fr/apidoc/2.0/projects/update.html
params = {project: {parent_id: "1710"}}

response = token.put("/v2/projects/" + projectID, params: params)

if response.status == 204
	puts "Project settings updated successfully.".green
end

### Get the new Project Information.
response = token.get("/v2/projects/" + projectID)
puts "New Project Settings: ".cyan
puts response.parsed
# => [{"id"=>6, "coordinates"=>[73.0, 53.0], "by"=>[], "kind"=>"project", "project_session_id"=>3}, {"id"=>4, "coordinates"=>[63.0, 81.0], "by"=>[], "kind"=>"exam", "project_session_id"=>2}, {"id"=>5, "coordinates"=>[80.0, 76.0], "by"=>[], "kind"=>"exam", "project_session_id"=>2}]
