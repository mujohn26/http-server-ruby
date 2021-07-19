
class RequestParser
  def split_params(params)
    query_values = {}
    params.split('&').map.with_index do |value, _index|
      query_value = value.split('=')
      query_values[query_value[0]] = query_value[1].nil? ? '' : query_value[1]
    end

    query_values
  end

end

# 