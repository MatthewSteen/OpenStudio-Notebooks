require 'openstudio'

file_name = "OsmName.osm"
file_name_new = "OsmNameNew.osm"

model_in_path = "#{File.dirname(__FILE__)}/#{file_name}"
model = OpenStudio::Model::Model.load(model_in_path).get
model_out_path = "#{File.dirname(__FILE__)}/#{file_name_new}"

zone_eqpts = model.getZoneHVACLowTempRadiantVarFlows

zone_eqpts.each do |zone_eqpt|

  zone_eqpt.remove

end

model.save(model_out_path,true)
