module FeedMolecule
  module Parser
    class RSSFeed < FeedMolecule::Feed

      def self.can_i_parse?(first_few_lines)
        %r{<rss version=} =~ first_few_lines
      end

      def self.parse(body)
        new(REXML::Document.new(body).root)
      end

      def initialize(document)
        xml = document.elements[1].elements
        @title = xml["title"].text unless xml["title"].nil?
        @description = xml["description"].text unless xml["description"].nil?
        @home_page_url = xml["link"].text unless xml["link"].nil?
        @feed_url = xml["atom:link/@href"].value unless xml["atom:link/@href"].nil?
        @items = build_items(xml)
      end

      private

      def build_items(xml)
        items = []
        total_items = xml["count(//channel/item)"]
        (1..total_items).each { |i| items.append(build_item(i, xml)) }
        items
      end

      def build_item(i, xml)
        FeedMolecule::Parser::RSSFeedEntry.new(xml["item[#{i}]"].elements)
      end
    end
  end
end
