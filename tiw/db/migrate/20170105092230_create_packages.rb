class CreatePackages < ActiveRecord::Migration[5.0]
  def change
    create_table :packages do |t|
      t.belongs_to :codestream, foreign_key: true
      t.string :name
      t.timestamps
    end
  end
end
