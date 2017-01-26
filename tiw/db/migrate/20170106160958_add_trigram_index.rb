class AddTrigramIndex < ActiveRecord::Migration[5.0]
  def change
    # Adds a tsvector column for the content
    add_column :package_files, :tsv_content, :tsvector

    # Adds an index for this new column
    execute <<-SQL
    CREATE INDEX index_content_tsv_content ON package_files USING gin(tsv_content);
    SQL

    # Updates existing rows so this new column gets calculated
    execute <<-SQL
    UPDATE package_files SET tsv_content = (to_tsvector('simple', coalesce(content, '')));
    SQL

    # Sets up a trigger to update this new column on inserts and updates
    execute <<-SQL
    CREATE TRIGGER tsvectorupdate BEFORE INSERT OR UPDATE
    ON package_files FOR EACH ROW EXECUTE PROCEDURE
    tsvector_update_trigger(tsv_content, 'pg_catalog.simple', content);
    SQL
  end
end
