namespace :package do
  task :import, [:codestream,:package,:package_path] => [:environment] do |t, args|
    # extension isnt the best solution
    codestream = Codestream.find_or_create_by(name: args[:codestream])
    accepted_extensions = [".c",".cpp",".h",".hpp",".rb",".py",".sh",
                           ".asm",".go",".java",".pl"]
    package = Package.new codestream: codestream, name: args[:package]
    Dir.glob(File.join("/home/vpereira/fpm","**","*")) do |f|
      if accepted_extensions.include? File.extname(f)
        package.package_files << PackageFile.new(path: f, content: File.read(f))
      end
    end
    package.save
  end
end
