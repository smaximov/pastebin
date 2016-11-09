# frozen_string_literal: true
module Api::Controllers::Pastes
  class Create
    include Api::Action

    params do
      required(:content).filled(:str?)
    end

    before :validate

    expose :paste

    def call(params)
      @paste = PasteRepository.create(Paste.new(content: params[:content], token: generate_token))
    end

    private

    def validate
      halt 422 unless params.valid?
    end

    def generate_token
      SecureRandom.hex(8)
    end
  end
end
