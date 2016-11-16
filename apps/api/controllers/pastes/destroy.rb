# frozen_string_literal: true
module Api::Controllers::Pastes
  class Destroy
    include Api::Action

    params do
      required(:id).filled(:int?)
      required(:access_token).filled(:str?)
    end

    def initialize(repository: PasteRepository.new)
      @repository = repository
    end

    def call(params)
      halt 422 unless params.valid?

      paste = @repository.find(params[:id])

      halt 404 if paste.nil?
      halt 403 unless paste.token == params[:access_token]

      @repository.delete(paste.id)
      self.status = 204
    end
  end
end
