module GetService
  def get_json(key,value)
    JSON.parse(conn(key,value).body, symbolize_names: true)
  end

  private

    def conn(key,value)
      faraday = Faraday.new(@url) do |f|
        f.headers[key] = value
        f.adapter Faraday.default_adapter
      end
      faraday.get
    end
end
