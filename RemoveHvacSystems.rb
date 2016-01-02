require 'openstudio'

file_name = "OsmName.osm"
file_name_new = "OsmNameNEW.osm"

model_in_path = "#{File.dirname(__FILE__)}/#{file_name}"
model = OpenStudio::Model::Model.load(model_in_path).get
model_out_path = "#{File.dirname(__FILE__)}/#{file_name_new}"

# get model objects
air_loops = model.getAirLoopHVACs
wtr_loops = model.getPlantLoops
zones = model.getThermalZones

# do stuff

air_loops.each do |al|
  al.remove
end

wtr_loops.each do |wl|

  if wl.name.to_s.include? "SHW"
    next
  else
    wl.remove
  end

end

zones.each do |z|

  z.equipment.each do |ze|

    if ze.to_FanZoneExhaust.is_initialized #or (equip.to_ZoneHVACUnitHeater.is_initialized and zone.get.equipment.size == 1)
      next
    else
      ze.remove
    end

  end

end

model.save(model_out_path,true)
