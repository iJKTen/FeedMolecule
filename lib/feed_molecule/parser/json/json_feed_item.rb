module FeedMolecule
  module Parser
    class JSONFeedItem < FeedMolecule::FeedItem
      include FeedUtilities

      def initialize(json_item)
        @id = json_item.fetch("id")
        @url = json_item.fetch("url", "")
        @external_url = json_item.fetch("external_url", "")
        @title = json_item.fetch("title", "")
        @summary = json_item.fetch("summary", "")
        @image = json_item.fetch("image", "")
        @banner_image = json_item.fetch("banner_image", "")
        @date_published = parse_date(json_item.fetch("date_published", nil))
        @date_modified = parse_date(json_item.fetch("date_modified", nil))
        @categories = json_item.fetch("tags", "")
        @author = parse_json_author(json_item.fetch("author", nil))
        @entry = parse_content(json_item.fetch("content_html", nil),
                               json_item.fetch("content_text", nil))
      end

      private

      def parse_content(html, text)
        html.nil? ? text : html
      end
    end
  end
end
