module FeedMolecule
  class FeedAuthor
    attr_reader :name, :url, :avatar, :email

    def self.parse_json_author(json_author)
      name = json_author.fetch("name", "") unless json_author.nil?
      url = json_author.fetch("url", "") unless json_author.nil?
      avatar = json_author.fetch("avatar", "") unless json_author.nil?
      new(name, url, avatar, "")
    end

    def self.parse_rss_author(rss_author)

    end

    def self.parse_atom_author(atom_author)
      name = atom_author["name"].text unless atom_author["name"].nil?
      url = atom_author["uri"].text unless atom_author["uri"].nil?
      email = atom_author["email"].text unless atom_author["email"].nil?
      new(name, url, "", email)
    end

    private

    def initialize(name, url, avatar, email)
      @name = name
      @url = url
      @avatar = avatar
      @email = email
    end

  end
end
