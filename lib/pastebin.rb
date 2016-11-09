# frozen_string_literal: true
require 'hanami/model'
require 'hanami/mailer'
require 'sequel'

Dir["#{__dir__}/pastebin/**/*.rb"].each { |file| require_relative file }

Hanami::Model.configure do
  adapter type: :sql, uri: ENV['DATABASE_URL']

  Sequel.database_timezone = :utc
  Sequel.application_timezone = :local

  migrations 'db/migrations'
  schema     'db/schema.sql'

  mapping do
    collection :pastes do
      entity Paste
      repository PasteRepository

      attribute :id, Integer
      attribute :content, String
      attribute :token, String
      attribute :created_at, DateTime
      attribute :updated_at, DateTime
    end
  end
end.load!

Hanami::Mailer.configure do
  root "#{__dir__}/pastebin/mailers"

  # See http://hanamirb.org/guides/mailers/delivery
  delivery do
    development :test
    test        :test
    # production :smtp, address: ENV['SMTP_PORT'], port: 1025
  end
end.load!
