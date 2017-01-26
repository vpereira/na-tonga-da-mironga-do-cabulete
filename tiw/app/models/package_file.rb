class PackageFile < ActiveRecord::Base
  belongs_to :package
  include PgSearch
  pg_search_scope :search_by_content, against: :content,
    using: {
      tsearch: {
        highlight: {
           start_sel: '_',
           stop_sel: '_'
        }
      }
    }
  # TODO
  # a lot of options to tweak here
  # https://github.com/Casecommons/pg_search
  # pg_search_scope :search_by_content, against: :content,
  # using: {
  #  tsearch: {
  #    dictionary: "simple", :tsvector_column => 'tsv_content',
  #    highlight: {
  #      start_sel: '<b>',
  #      stop_sel: '</b>'
  #    }
  #  }
  #},
  # ranked_by: "1.2 * :trigram + 0.5 * :tsearch"
end
