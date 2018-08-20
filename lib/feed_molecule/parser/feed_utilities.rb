module FeedMolecule
  module Parser
    module FeedUtilities
      def parse_json_author(json_author)
        FeedMolecule::Parser::JSONFeedAuthor.new(json_author) unless json_author.nil?
      end

      def parse_date(str_date)
        Date.parse str_date unless str_date.nil?
      end

      def get_list_of_items_from_xpath(document, xpath)
        document.elements.each(xpath) { |item| }
      end

      def get_href_from_list(links, rel_name)
        href = ""
        links.each { |link|
          href = link.attributes["href"] if link.attributes["rel"] == rel_name
        }
        href
      end
    end
  end
end
