namespace :package do
  task :import, [:codestream,:package,:package_path] => [:environment] do |t, args|
    # extension isnt the best solution
    codestream = Codestream.find_or_create_by(name: args[:codestream])
    #
    # do we have to import all files? maybe yes
    # however to the trigram indexing we should index just source code
    accepted_extensions = [".c",".cpp",".h",".hpp",".rb",".py",".sh",
                           ".asm",".go",".java",".pl",".lua",".js",".r"]
    package = Package.new codestream: codestream, name: args[:package]
    Dir.glob(File.join(args[:package_path],"**","*")) do |f|
    # TODO
    # we should remove it. its breaking without
    # some files have null strings inside, which break when saving
    if accepted_extensions.include? File.extname(f)
        # if File.file?(f)
          package.package_files << PackageFile.new(path: f, content: File.read(f))
        # end
    end
    end
    package.save
  end
end
