module GetService
  def conn
    Faraday.get(@url)
  end

  def conn_headers(key,value)
    faraday = Faraday.new(@url) do |f|
      f.headers[key] = value
      f.adapter Faraday.default_adapter
    end
    faraday.get
  end

  def get_json
    JSON.parse(conn.body, symbolize_names: true)
  end

  def get_json_headers(key,value)
    JSON.parse(conn_headers(key,value).body, symbolize_names: true)
  end
end
