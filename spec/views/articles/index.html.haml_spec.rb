require 'rails_helper'

RSpec.describe 'articles/index.html.haml' do
  before :each do
    assign(:articles, [
      stub_model(Article, title: '1', description: '1 description'),
    ])
  end

  it 'displays article content correctly' do
    render

    expect(rendered).to match(/1/)
    expect(rendered).to match(/1 description/)
  end
end
