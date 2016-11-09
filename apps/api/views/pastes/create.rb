# frozen_string_literal: true
module Api::Views::Pastes
  class Create
    include Api::View

    def paste_url
      raw routes.paste_url(paste.id)
    end

    def access_token
      raw paste.token
    end
  end
end
