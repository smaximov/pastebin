# frozen_string_literal: true
module Api::Controllers::Pastes
  class Destroy
    include Api::Action

    params do
      required(:id).filled(:int?)
      required(:access_token).filled(:str?)
    end

    def call(params)
      halt 422 unless params.valid?

      paste = PasteRepository.find(params[:id])

      halt 404 if paste.nil?
      halt 403 unless paste.token == params[:access_token]

      PasteRepository.delete(paste)
      self.status = 204
    end
  end
end
