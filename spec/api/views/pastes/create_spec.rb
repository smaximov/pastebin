# frozen_string_literal: true
require_relative '../../../../apps/api/views/pastes/create'

RSpec.describe Api::Views::Pastes::Create do
  let(:paste) { Paste.new(id: 42, content: 'some content', token: 'some token') }
  let(:exposures) { Hash[paste: paste] }
  let(:template)  { Hanami::View::Template.new('apps/api/templates/pastes/create.text.erb') }
  let(:view)      { described_class.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'exposes #paste' do
    expect(view.paste).to eq exposures.fetch(:paste)
  end

  it 'displays the URL of the paste' do
    expect(rendered).to match(%r{/api/pastes/42})
  end

  it 'displays the access token' do
    expect(rendered).to match('Access token: some token')
  end
end
