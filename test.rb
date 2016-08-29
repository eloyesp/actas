require 'cuba/test'
require 'pry'
require_relative 'actas'

scope do
  test 'Nueva acta' do
    get '/actas/nueva'
    assert last_response.successful?
  end
end
