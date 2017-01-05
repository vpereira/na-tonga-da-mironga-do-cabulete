module PackageUtils
  ACCEPTED_EXTENSIONS = [".spec",".c",".cpp",".h",".hpp",".rb",".py",".sh",
                         ".asm",".go",".java",".pl",".lua",".js",".r"]
  ACCEPTED_FILES = ["Makefile"]

  def self.accepted_file?(f)
    return true if ACCEPTED_EXTENSIONS.include? File.extname(f) or ACCEPTED_FILES.include?(f)
    false
  end

  def self.force_unicode(str)
    str.encode(Encoding.find('UTF-8'), {invalid: :replace, undef: :replace, replace: ''})
  end
end
