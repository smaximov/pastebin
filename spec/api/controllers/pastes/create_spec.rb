# frozen_string_literal: true
require_relative '../../../../apps/api/controllers/pastes/create'

RSpec.describe Api::Controllers::Pastes::Create do
  let(:action) { described_class.new }

  after do
    PasteRepository.clear
  end

  context 'with invalid parameters' do
    let(:params) { Hash[] }

    it 'is 422 Unprocessable Entity' do
      response = action.call(params)
      expect(response[0]).to eq(422)
    end
  end

  context 'with valid parameters' do
    let(:params) { Hash[content: 'some content'] }

    it 'is successful' do
      response = action.call(params)
      expect(response[0]).to eq(200)
    end
  end
end
