# frozen_string_literal: true
module Api::Controllers::Pastes
  class Update
    include Api::Action

    params do
      required(:id).filled(:int?)
      required(:access_token).filled(:str?)
      required(:content).filled(:str?)
    end

    def call(params)
      halt 422 unless params.valid?

      paste = PasteRepository.find(params[:id])

      halt 404 if paste.nil?
      halt 403 unless paste.token == params[:access_token]

      paste.update(content: params[:content], updated_at: Time.now)
      PasteRepository.update(paste)
      self.status = 204
    end
  end
end
