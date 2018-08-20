module FeedMolecule
  module Parser
    class JSONFeedAuthor
      attr_reader :name, :url, :avatar

      def initialize(json_author)
        @name = json_author.fetch("name", "")
        @url = json_author.fetch("url", "")
        @avatar = json_author.fetch("avatar", "")
      end
    end
  end
end
