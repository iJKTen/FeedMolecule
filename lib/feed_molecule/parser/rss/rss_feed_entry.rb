module FeedMolecule
  module Parser
    class RSSFeedEntry < FeedMolecule::FeedEntry
      include FeedUtilities

      def initialize(item)
        @id = item["guid"].text unless item["guid"].nil?
        @url = item["link"].text unless item["link"].nil?
        @external_url = item["enclosure/@url"].value unless item["enclosure/@url"].nil?
        @title = item["title"].text unless item["title"].nil?
        @entry = item["description"].text unless item["description"].nil?
        @date_published = parse_date(item["pubDate"].text) unless item["pubDate"].nil?
        unless item["enclosure"].nil?
          attrs_enclosure = item["enclosure"].attributes
          @image = attrs_enclosure["url"] if attrs_enclosure["type"] == "image/jpeg"
        end
      end
    end
  end
end
