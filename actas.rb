require 'cuba'
require 'cuba/safe'
require 'cuba/render'
require 'slim'

Cuba.use Rack::Session::Cookie, :secret => '__a_very_long_string__'

Cuba.plugin Cuba::Safe
Cuba.plugin Cuba::Render
Cuba.settings[:render][:template_engine] = 'slim'

Cuba.define do
  on get do
    on 'actas', 'nueva' do
      render('nueva_acta')
    end
  end
end
