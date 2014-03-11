class M3Level < ActiveRecord::Base
  belongs_to :m3_board

  has_and_belongs_to_many :projects

  def to_xml(options = {})
    options[:indent] ||= 2
    xml = options[:builder] ||= ::Builder::XmlMarkup.new(:indent => options[:indent])
    #xml.instruct! unless options[:skip_instruct]
    xml.level(id: self.id, name: self.name, active: self.active, order: self.order, icons: self.icons, m3_board_id: self.m3_board_id)
  end
end
