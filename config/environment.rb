# frozen_string_literal: true
require 'bundler/setup'
require 'hanami/setup'
require 'hanami/model'
require 'hanami/mailer'
require 'sequel'

require_relative '../lib/pastebin'
require_relative '../apps/api/application'
require_relative '../apps/web/application'

Hanami.configure do
  mount Api::Application, at: '/api'
  mount Web::Application, at: '/'

  model do
    adapter :sql, ENV.fetch('DATABASE_URL')

    Sequel.database_timezone = :utc
    Sequel.application_timezone = :local

    migrations 'db/migrations'
    schema     'db/schema.sql'
  end

  mailer do
    root "#{__dir__}/pastebin/mailers"

    # See http://hanamirb.org/guides/mailers/delivery
    delivery do
      development :test
      test        :test
      # production :smtp, address: ENV['SMTP_PORT'], port: 1025
    end
  end
end
