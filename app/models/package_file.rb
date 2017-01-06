class PackageFile < ApplicationRecord
  belongs_to :package
  include PgSearch
  # TODO
  # a lot of options to tweak here
  # https://github.com/Casecommons/pg_search
  pg_search_scope :search_by_content, :against => :content,  :using => [:tsearch, :trigram]
end
