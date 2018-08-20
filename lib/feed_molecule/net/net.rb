module FeedMolecule
  module NetRequest
    def self.get(url)
      uri = URI(url)
      response = Net::HTTP.get_response(uri)
      { status_code: response.code.to_i,
        content_type: response.content_type,
        body: response.body,
        first_few_lines: response.body.slice(0, 1000)
      }
    end
  end
end
