module FeedMolecule
  module Parser
    class JSONFeed < FeedMolecule::Feed
      include FeedUtilities

      def self.can_i_parse?(first_few_lines)
        %r{https:\/\/jsonfeed.org\/version\/} =~ first_few_lines
      end

      def self.parse(body)
        new(JSON.parse(body))
      end

      def initialize(json)
        @title = json.fetch("title")
        @home_page_url = json.fetch("home_page_url", "")
        @feed_url = json.fetch("feed_url", "")
        @description = json.fetch("description", "")
        @icon = json.fetch("icon", "")
        @favicon = json.fetch("favicon", "")
        @author = parse_json_author(json.fetch("author", nil))
        @items = parse_items(json.fetch("items", nil))
      end

      private

      def parse_items(items)
        items.map { |e| FeedMolecule::Parser::JSONFeedEntry.new(e)  }
      end
    end
  end
end
