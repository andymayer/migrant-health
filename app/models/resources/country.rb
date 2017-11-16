module Resources
  class Country < Resource
    belongs_to :resources_chunk,             optional: true, class_name: 'FurtherInformationChunk', foreign_key: 'further_information_chunk_id'
    
    accepts_nested_attributes_for :resources_chunk,              reject_if: :all_blank

    def icon_file_name
      'icon-fact-sheet.svg'
    end

    def icon_alt_text
      'Country'
    end
  end
end
