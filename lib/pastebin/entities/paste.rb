# frozen_string_literal: true

class Paste
  include Hanami::Entity

  attributes :content, :token, :created_at, :updated_at
end
