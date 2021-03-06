# frozen_string_literal: true
module Api::Controllers::Pastes
  class Create
    include Api::Action

    params do
      required(:content).filled(:str?)
    end

    expose :paste

    def initialize(repository: PasteRepository.new)
      @repository = repository
    end

    def call(params)
      halt 422 unless params.valid?
      @paste = @repository.create(content: params[:content], token: generate_token)
    end

    private

    def generate_token
      SecureRandom.hex(8)
    end
  end
end
