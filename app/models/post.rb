class Post < ActiveRecord::Base

  validates :title, :presence => true, :uniqueness => true
  validates :body, :presence => true

  has_many :post_tag_connections, :dependent => :destroy
  has_many :tags, :through => :post_tag_connections

  # Before create: set tags from :tag_list
  def tag_names=(tag_names)
    tag_list = tag_names.split(',')
    cleaned_tag_list = clean(tag_list)
    self.tags = find_or_create_tags(cleaned_tag_list)
  end

  def clean(array)
    array.map { |word| word.strip }
  end

  def find_or_create_tags(tag_list)
    tag_list.map do |desired_tag|
      Tag.find_or_create_by_name(desired_tag)
    end
  end

  def tags_joined
    self.tags.map(&:name).join(", ")
  end
end
