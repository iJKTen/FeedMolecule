RSpec.describe FeedMolecule do
  let(:feed) { FeedMolecule.parse("https://daringfireball.net/feeds/json") }
  let(:xml_feed) { FeedMolecule.parse("https://www.nasa.gov/rss/dyn/breaking_news.rss") }
  let(:atom_feed) { FeedMolecule.parse("https://daringfireball.net/feeds/main") }

  it "has a version number" do
    expect(FeedMolecule::VERSION).not_to be nil
  end

  it "parses json" do
    expect(feed).not_to be nil
  end

  it "download file" do
    response = FeedMolecule::NetRequest.get("https://daringfireball.net/feeds/json")
    expect(response).not_to be nil
    expect(response[:status_code]).to eql(200)
  end

  it "get json parser" do
    first_few_lines = "\"version\" : \"https://jsonfeed.org/version/1\","
    parser = FeedMolecule::Parser.get_parser(first_few_lines)
    expect(parser).not_to be nil
  end

  it "can parse rss" do
    first_few_lines = "<rss version="
    parser = FeedMolecule::Parser.get_parser(first_few_lines)
    expect(parser).not_to be nil
  end

  it "parse xml" do
    expect(xml_feed).not_to be nil
  end

  it "rss title to not be empty" do
    expect(xml_feed.title).not_to be nil
  end

  it "get atom parser" do
    first_few_lines = "<?xml version=\"1.0\" encoding=\"utf-8\"?><feed xmlns=\"http://www.w3.org/2005/Atom\">"
    parser = FeedMolecule::Parser.get_parser(first_few_lines)
    expect(parser).not_to be nil
  end

  it "can parse atom feed" do
    expect(atom_feed).not_to be nil
  end

  it "atom feed home pageurl" do
    expect(atom_feed.home_page_url).not_to be nil
  end
end
