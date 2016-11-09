# frozen_string_literal: true

Hanami::Model.migration do
  change do
    create_table :pastes do
      primary_key :id
      column :content, String, null: false
      column :token, String, null: false
      column :created_at, DateTime, null: false, default: Sequel::CURRENT_TIMESTAMP
      column :updated_at, DateTime, null: false, default: Sequel::CURRENT_TIMESTAMP
    end
  end
end
