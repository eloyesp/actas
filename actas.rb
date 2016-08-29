require 'cuba'
require 'cuba/safe'

Cuba.use Rack::Session::Cookie, :secret => '__a_very_long_string__'

Cuba.plugin Cuba::Safe

Cuba.define do
  on get do
    on 'actas', 'nueva' do
      on root do
        res.write 'Hello world!'
      end
    end
  end
end
