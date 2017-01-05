class CreatePackageFiles < ActiveRecord::Migration[5.0]
  def change
    create_table :package_files do |t|
      t.string :path
      t.text :content
      t.belongs_to :package, foreign_key: true

      t.timestamps
    end
  end
end
