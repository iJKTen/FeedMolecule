require 'date'
require 'net/http'
require 'json'
require 'rexml/document'
require 'feed_molecule/version'
require 'feed_molecule/net/net'
require 'feed_molecule/feed'
require 'feed_molecule/feed_item'
require 'feed_molecule/feed_author'
require 'feed_molecule/parser/feed_utilities'
require 'feed_molecule/parser/parser'
require 'feed_molecule/parser/json/json_parser'
require 'feed_molecule/parser/json/json_feed_item'

require 'feed_molecule/parser/rss/rss_parser'
require 'feed_molecule/parser/rss/rss_feed_item'

require 'feed_molecule/parser/atom/atom_parser.rb'
require 'feed_molecule/parser/atom/atom_feed_item.rb'

module FeedMolecule
  def self.parse(url)
    document = FeedMolecule::NetRequest.get(url)
    if document[:status_code] == 200
      parser = FeedMolecule::Parser.get_parser(document[:first_few_lines])
      parser.parse(document[:body]) unless parser.nil?
    end
  end
end
