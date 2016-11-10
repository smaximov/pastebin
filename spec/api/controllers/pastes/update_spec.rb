# frozen_string_literal: true
require_relative '../../../../apps/api/controllers/pastes/update'

RSpec.describe Api::Controllers::Pastes::Update do
  let(:action) { described_class.new }
  let(:id) { 42 }
  let(:access_token) { 'token' }
  let(:content) { 'new content' }
  let(:params) { Hash[id: 42, access_token: access_token, content: content] }

  context 'with invalid params' do
    context 'when access token is missing' do
      let(:access_token) { nil }

      it 'is 422 Unprocessable Entity' do
        response = action.call(params)
        expect(response[0]).to eq(422)
      end
    end

    context 'when content is missing' do
      let(:content) { nil }

      it 'is 422 Unprocessable Entity' do
        response = action.call(params)
        expect(response[0]).to eq(422)
      end
    end
  end

  context 'with valid params' do
    before do
      allow(PasteRepository).to receive(:find).with(id).and_return(paste)
      expect(PasteRepository).to receive(:find).with(id)
    end

    context 'with a non-existing paste' do
      let(:paste) { nil }

      it 'is 404 Not Found' do
        response = action.call(params)
        expect(response[0]).to eq(404)
      end
    end

    context 'with an existing paste' do
      let(:paste) { Paste.new(id: id, content: 'some content', token: 'deadbeef') }

      context 'with a matching access token' do
        let(:access_token) { 'deadbeef' }

        it 'is 204 No Content' do
          response = action.call(params)
          expect(response[0]).to eq(204)
        end
      end

      context 'with a non-matching access token' do
        let(:access_token) { 'deadbabe' }

        it 'is 403 Forbidden' do
          response = action.call(params)
          expect(response[0]).to eq(403)
        end
      end
    end
  end
end
