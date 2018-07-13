class Article < ApplicationRecord
  has_attached_file :img, styles: {medium: "300x300>", thumb: "100x100>"}, default_url: "/images/down.png"
  validates_attachment_content_type :img, content_type: /\Aimage\/.*\z/

  has_many :tags

  def tag_list
    self.tags.map {|t| t.name}.join(", ")
  end

  def tag_list=(new_value)
    tag_names = new_value.split(/,\s+/)
    self.tags = tag_names.map {|name| Tag.where('name = ?', name).first or Tag.create(:name => name)}
  end

end
