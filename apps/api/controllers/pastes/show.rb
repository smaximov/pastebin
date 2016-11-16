# frozen_string_literal: true
module Api::Controllers::Pastes
  class Show
    include Api::Action

    expose :paste

    def initialize(repository: PasteRepository.new)
      @repository = repository
    end

    def call(params)
      @paste = @repository.find(params[:id])
      halt 404 if @paste.nil?
    end
  end
end
