# frozen_string_literal: true
require_relative '../../../../apps/api/controllers/pastes/show'

RSpec.describe Api::Controllers::Pastes::Show do
  let(:repository) { instance_double(PasteRepository) }
  let(:action) { described_class.new(repository: repository) }
  let(:id) { 42 }
  let(:params) { Hash[id: id] }

  before do
    expect(repository).to receive(:find).with(id).and_return(paste)
  end

  context 'with an existing paste' do
    let(:paste) { Paste.new(id: id, content: 'some content', token: 'deadbeef') }

    it 'is successful' do
      response = action.call(params)
      expect(response[0]).to eq(200)
    end
  end

  context 'with a non-existing paste' do
    let(:paste) { nil }

    it 'is 404 Not Found' do
      response = action.call(params)
      expect(response[0]).to eq(404)
    end
  end
end
