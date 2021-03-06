# == Schema Information
#
# Table name: tags
#
#  id             :integer          not null, primary key
#  name           :string
#  taggings_count :integer          default(0)
#  description    :text
#  slug           :text
#  featured       :boolean          default(FALSE)
#

class Topic < ActsAsTaggableOn::Tag

  validate :check_slug_characters
  validates :slug, uniqueness: true

  def self.featured
    where(featured: true)
  end

  private

  def check_slug_characters
    errors.add(:slug, "URL must not be empty") if slug.empty?
    errors.add(:slug, "URL not not contain spaces") if slug.include? " "
    errors.add(:slug, "URL mustcontain only alphanumeric characters") if !slug.match?(/^[A-Za-z0-9]+(?:-[A-Za-z0-9]+)*$/)
  end

end
