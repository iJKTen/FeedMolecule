module FeedMolecule
  module Parser
    class AtomFeedItem < FeedMolecule::FeedItem
      include FeedUtilities

      def initialize(item)
        links = get_list_of_items_from_xpath(item, "link")
        author = get_list_of_items_from_xpath(item, "author")
        @id = item.elements["id"].text unless item.elements["id"].nil?
        @title = item.elements["title"].text unless item.elements["title"].nil?
        @entry = item.elements["content"].text unless item.elements["content"].nil?
        @url = get_href_from_list(links, "related")
        if @url.empty?
          @url = get_href_from_list(links, "alternate")
          @external_url = ""
        else
          @external_url = get_href_from_list(links, "alternate")
        end
        @author = AtomFeedAuthor.new(author[0].elements) unless author.nil?
        @date_published = parse_date(item.elements["published"].text) unless item.elements["published"].nil?
        @date_modified = parse_date(item.elements["updated"].text) unless item.elements["updated"].nil?
      end
    end
  end
end
