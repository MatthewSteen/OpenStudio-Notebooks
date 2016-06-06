require 'openstudio'

file_name = "OsmName.osm"
file_name_new = "OsmNameNew.osm"

model_in_path = "#{File.dirname(__FILE__)}/#{file_name}"
model = OpenStudio::Model::Model.load(model_in_path).get
model_out_path = "#{File.dirname(__FILE__)}/#{file_name_new}"

# initialize variables


# get model objects


# do stuff


model.save(model_out_path,true)
