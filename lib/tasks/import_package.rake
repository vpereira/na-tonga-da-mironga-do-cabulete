require 'package_utils'

namespace :package do
  task :import, [:codestream,:package,:package_path] => [:environment] do |t, args|
    # extension isnt the best solution
    codestream = Codestream.find_or_create_by(name: args[:codestream])
    package = Package.new codestream: codestream, name: args[:package]
    Dir.glob(File.join(args[:package_path],"**","*")) do |f|
      # TODO
      # we should remove it.
      # some files have null strings inside, which break when saving
      # in postgres with text field (exactly the type of content)
      # if i want to do full text search i need it as text (i think!)
      # so whitelisting which type i want, helps me. but the list is incomplete
      if PackageUtils.accepted_file?(f)
        package.package_files << PackageFile.new(path: f, content: PackageUtils.force_unicode(File.read(f)))
      end
    end
    package.save
  end
end
