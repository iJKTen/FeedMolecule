require "feed_molecule/version"
require "feed_molecule/net/net"

module FeedMolecule
  # Your code goes here...
  def self.test
    a = FeedMolecule::NET.new
    a.hello
  end
end
