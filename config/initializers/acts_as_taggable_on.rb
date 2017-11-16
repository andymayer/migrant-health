require 'acts_as_taggable_on/tag'

# Monkey Patch tag so we can use pretty urls
module ActsAsTaggableOn
  class Tag
    acts_as_url :name, url_attribute: :slug

    def params
      slug
    end
  end
end

