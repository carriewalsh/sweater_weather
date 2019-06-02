module GetService
  def conn
    Faraday.get(@url)
  end

  def get_json
    JSON.parse(conn.body, symbolize_names: true)
  end
end
