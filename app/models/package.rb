class Package < ApplicationRecord
  has_many :package_files
  belongs_to :codestream
end
