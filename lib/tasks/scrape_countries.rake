require 'nokogiri'
require 'open-uri'

namespace :scrape do
  task countries: :environment do

    doc = Nokogiri::HTML(open('https://www.gov.uk/government/collections/migrant-health-guide-countries-a-to-z'))
    hash = Hash[doc.xpath('//a[@href]').map {|link| [link.text.strip, link["href"]]}]
    hash.select! {|k,_v| k.include?(':') }

    hash.each do |title, url|

      fic = FurtherInformationChunk.create(
        title: 'Resources'
      )

      ExternalResource.create(
        further_information_chunk_id: fic.id,
        title: 'gov.uk - guidance',
        url: "https://www.gov.uk#{url}",
        resource_type: 'html'
      )

      Resources::Country.create( 
        title: title,
        intro: 'Government guidance',
        contributed_by: 'gov.uk',
        further_information_chunk_id: fic.id
      )
    end
  end
end
