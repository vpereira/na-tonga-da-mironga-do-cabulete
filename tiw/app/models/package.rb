class Package < ActiveRecord::Base
  has_many :package_files
  belongs_to :codestream
end
