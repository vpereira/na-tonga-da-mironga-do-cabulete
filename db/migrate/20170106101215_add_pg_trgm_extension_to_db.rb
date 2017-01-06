class AddPgTrgmExtensionToDb < ActiveRecord::Migration[5.0]
  # enable pg_trgm to search for trigrams
  def change
    execute "create extension pg_trgm;"
  end
end
