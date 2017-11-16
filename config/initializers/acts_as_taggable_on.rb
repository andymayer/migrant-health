require 'acts_as_taggable_on/tag'

# Monkey Patch tag so we can use pretty urls
module ActsAsTaggableOn
  class Tag
    acts_as_url :name, url_attribute: :slug

    def to_param
      slug
    end
  end
end

