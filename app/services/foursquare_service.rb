class FoursquareService
  def authenticate!(client_id, client_secret, code)
    def create
      resp = Faraday.post("https://github.com/login/oauth/access_token") do |req|
        req.body = { 'client_id': ENV['GITHUB_CLIENT'], 'client_secret': ENV['GITHUB_SECRET'], 'code': params[:code]}
        req.headers['Accept'] = 'application/json'
      end

      body = JSON.parse(resp.body)
      body['access_token']
    end
  end

  def friends(token)
    resp = Faraday.get("https://api.foursquare.com/v2/users/self/friends") do |req|
      req.params['oauth_token'] = token
      # don't forget that pesky v param for versioning
      req.params['v'] = '20160201'
    end
    JSON.parse(resp.body)["response"]["friends"]["items"]
  end
end
