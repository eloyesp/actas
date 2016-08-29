require 'cuba/capybara'
require 'pry'
require_relative 'actas'

def assert_page_has_content content
  assert has_content?(content),
    "Expected this page \n#{ page.body }\n to have content: #{ content }."
end

def assert_page_has_selector selector
  assert has_selector?(selector),
    "Expected this page \n#{ page.body }\n to match: #{ selector }."
end

class Borrador
  def enviar_confirmacion
    $confirmacion = true
  end
end

scope do
  test 'Nueva acta' do
    visit '/actas/nueva'
    assert_page_has_content 'Nueva acta'
    fill_in 'fecha',       with: '2016-10-26'
    fill_in 'institución', with: 'Simulacros y simulaciones'
    fill_in 'miembros',    with: 'eloyesp@gmail.com; fake@example.com'
    fill_in 'cuerpo',      with: 'Se habló de todo un poco'
    fill_in 'firma',      with: 'eloyesp@gmail.com'
    click_on 'Hecho'
    assert_page_has_content 'recibirá un correo de confirmación'
    assert $confirmacion
  end
end
