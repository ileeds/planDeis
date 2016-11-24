require 'net/http'

url = 'http://registrar-prod-rhel6.unet.brandeis.edu/export/export.json'
uri = URI(url)
response = Net::HTTP.get(uri).force_encoding("UTF-8")
response.each_line do |j|
  line = JSON.parse(j)
  if line["type"]=="course" && line["term"]=="1171"
    name = line["name"]
    code = line["code"]
    pds = line["description"].split("\n")
    if pds.size==4
      prerequisite = pds[0]
      description = pds[2]
      professor = pds[3]
    elsif pds.size==1
      prerequisite = nil
      description = nil
      professor = pds[0]
    else
      prerequisite = nil
      description = pds[0]
      professor = pds[1]
    end
    independent_study = line["independent_study"]
    requirements = line["requirements"]
    subjects = line["subjects"]
    Course.create!(name: name, code: code, prerequisite: prerequisite, independent_study: independent_study, requirements: requirements, subjects: subjects, description: description, professor: professor)
  end
end