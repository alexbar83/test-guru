class GitHubClient
  ACCESS_TOKEN = "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"
  ROOT_ENDPOINT = 'https://api.github.com'

  def initialize
    @http_client = setup_http_client
  end

  def create_gist(params)
    @http_client.post('gists', params) do |request|
      request.headers['Authorization'] = ACCESS_TOKEN
      request.headers['Content-Type'] = 'application/json'
      request.body = params.to_json
    end
  end

  private

  def setup_http_client
    Faraday.new(url: ROOT_ENDPOINT)
  end
end 
