json.array!(@m3_levels) do |m3_level|
  json.extract! m3_level, :id, :name, :data, :active, :order, :icons
  json.url m3_level_url(m3_level, format: :json)
end
