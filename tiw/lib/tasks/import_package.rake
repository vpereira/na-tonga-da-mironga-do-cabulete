require 'package_utils'

namespace :package do
  task :import, [:codestream,:package,:package_path] => :environment  do |t, args|
    # extension isnt the best solution
    codestream = Codestream.find_or_create_by(name: args[:codestream])
    package = Package.new codestream: codestream, name: args[:package]
    Dir.glob(File.join(args[:package_path],"**","*")) do |f|
      if PackageUtils.is_text?(f)
        begin
          package.package_files << PackageFile.new(path: f, content: PackageUtils.force_unicode(File.read(f)))
          package.save
        rescue => ex
          puts "#{f} had exception #{ex.message}"
        end
      end
    end
    package.save
  end
end
