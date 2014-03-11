class GameType < ActiveRecord::Base
  has_many :projects

  def to_xml(options = {})
    options[:indent] ||= 2
    xml = options[:builder] ||= ::Builder::XmlMarkup.new(:indent => options[:indent])
    xml.instruct! unless options[:skip_instruct]
    xml.game_type(id: self.id, name: self.name)
  end

end
