module FeedMolecule
  module Parser
    def self.get_parser(body)
      parsers.detect { |p| p.can_i_parse?(body) }
    end

    private
      def self.parsers
        [
          FeedMolecule::Parser::JSONFeed,
          FeedMolecule::Parser::RSSFeed,
          FeedMolecule::Parser::AtomFeed
        ]
      end
  end
end
