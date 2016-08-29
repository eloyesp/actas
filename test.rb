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

scope do
  test 'Nueva acta' do
    visit '/actas/nueva'
    assert_page_has_content 'Nueva acta'
    assert_page_has_selector 'form'
  end
end
