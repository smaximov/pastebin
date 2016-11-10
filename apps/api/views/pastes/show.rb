# frozen_string_literal: true
module Api::Views::Pastes
  class Show
    include Api::View

    def render
      raw paste.content
    end
  end
end
