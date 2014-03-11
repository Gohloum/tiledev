class Project < ActiveRecord::Base
  has_one :game_type

  has_and_belongs_to_many :m3_levels

  # Here we override the to_xml method so we can output each
  # returned row from the database as a single xml node with attributes
  def to_xml(options = {})
    options[:indent] ||= 2
    xml = options[:builder] ||= ::Builder::XmlMarkup.new(:indent => options[:indent])
    xml.instruct! unless options[:skip_instruct]
    xml.project(id: self.id, name: self.name, game_type_id: self.game_type_id)
  end
end
