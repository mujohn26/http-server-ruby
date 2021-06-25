class Addressable
  def uri(uri_string)
    splited_uri_string = uri_string.split('?')
    query_values = splited_uri_string[1].nil? ? nil : split_query_string(splited_uri_string[1])
    path = splited_uri_string[0]
    {
      path: path,
      query_values: query_values
    }
  end

  def split_query_string(query_string)
    query_values = {}
    query_string.split('&').map.with_index do |value, _index|
      query_value = value.split('=')
      query_values[query_value[0]] = query_value[1].nil? ? '' : query_value[1]
    end

    query_values
  end
end
