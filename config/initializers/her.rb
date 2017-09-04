Her::API.setup url: "https://still-sierra-89479.herokuapp.com/" do |c|
  #Request
  c.use Faraday::Request::UrlEncoded

  #Response
  c.use Her::Middleware::DefaultParseJSON

  #Adapter
  c.use Faraday::Adapter::NetHttp
end
