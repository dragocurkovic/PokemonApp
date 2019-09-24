module ApiHelpers
  extend ActiveSupport::Concern

  def set_api_headers(user)
    request.headers['X-Token'] = user.token
    request.headers['X-Email'] = user.email
  end

  def parsed_response
    JSON.parse(response.body, symbolize_names: true)
  end
end
