# frozen_string_literal: true
module Api::Controllers::Pastes
  class Show
    include Api::Action

    expose :paste

    def call(params)
      @paste = PasteRepository.find(params[:id])
      halt 404 if @paste.nil?
    end
  end
end
