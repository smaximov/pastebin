# frozen_string_literal: true
require_relative '../../../../apps/api/views/pastes/show'

RSpec.describe Api::Views::Pastes::Show do
  let(:paste) { Paste.new(id: 42, content: 'some content', token: 'deadbeef') }
  let(:exposures) { Hash[paste: paste] }
  let(:template)  { nil }
  let(:view)      { described_class.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'renders paste content' do
    expect(rendered).to eq(paste.content)
  end
end
