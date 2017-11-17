require 'acts_as_taggable_on/tag'

# Monkey Patch tag so we can use pretty urls
module ActsAsTaggableOn
  class Tag
    include PgSearch
    acts_as_url :name, url_attribute: :slug

    multisearchable against: :name

    def icon_file_name
      'icon-fact-sheet.svg'
    end

    def icon_alt_text
      'Fact Sheet'
    end

    def title
      name
    end

    def intro
      'This is a topic'
    end

    def to_param
      slug
    end
  end
end

