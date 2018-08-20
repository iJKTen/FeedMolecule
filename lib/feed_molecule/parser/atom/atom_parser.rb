module FeedMolecule
  module Parser
    class AtomFeed < FeedMolecule::Feed
      include FeedUtilities

      def self.can_i_parse?(first_few_lines)
        %r{<feed xmlns="http://www.w3.org/2005/Atom"} =~ first_few_lines
      end

      def self.parse(body)
        new(REXML::Document.new(body).root)
      end

      def initialize(document)
        links = get_list_of_items_from_xpath(document, "//feed/link")
        entries = get_list_of_items_from_xpath(document, "//feed/entry")
        author_xml = get_list_of_items_from_xpath(document, "//feed/author")
        xml = document.elements[1].elements
        @title = xml["title"].text unless xml["title"].nil?
        @description = xml["description"].text unless xml["description"].nil?
        @home_page_url = get_href_from_list(links, "alternate")
        @feed_url = get_href_from_list(links, "self")
        @author = FeedMolecule::FeedAuthor.parse_atom_author(author_xml) unless author_xml.count == 0
        @items = build_items(xml)
      end

      private

      def build_items(xml)
        items = []
        total_items = xml["count(//feed/entry)"]
        (1..total_items).each { |i| items.append(build_item(i, xml))}
        items
      end

      def build_item(i, xml)
        FeedMolecule::Parser::AtomFeedItem.new(xml["//feed/entry[#{i}]"])
      end
    end
  end
end
