require 'cuba'
require 'cuba/safe'
require 'cuba/render'
require 'slim'
require_relative 'borrador'

Cuba.use Rack::Session::Cookie, :secret => '__a_very_long_string__'

Cuba.plugin Cuba::Safe
Cuba.plugin Cuba::Render
Cuba.settings[:render][:template_engine] = 'slim'

Cuba.define do
  on 'actas', 'nueva' do
    on get do
      render('nueva_acta')
    end

    on post do
      # todo: should filter params
      borrador = Borrador.new(req.params)
      borrador.enviar_confirmacion
      render('confirmacion', borrador: borrador)
    end
  end

end
