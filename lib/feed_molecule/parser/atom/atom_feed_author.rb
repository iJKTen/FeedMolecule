module FeedMolecule
  module Parser
    class AtomFeedAuthor
      attr_reader :name, :url, :email

      def initialize(atom_author)
        @name = atom_author["name"].text unless atom_author["name"].nil?
        @url = atom_author["uri"].text unless atom_author["uri"].nil?
        @email = atom_author["email"].text unless atom_author["email"].nil?
      end
    end
  end
end
