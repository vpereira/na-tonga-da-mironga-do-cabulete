require "open3"

module PackageUtils
  ACCEPTED_EXTENSIONS = [".spec",".c",".cpp",".h",".hpp",".rb",".py",".sh",
                         ".asm",".go",".java",".pl",".lua",".js",".r"]
  ACCEPTED_FILES = ["Makefile"]


  def self.is_text?(filename)
    file_type, status = Open3.capture2e("file", filename)
    status.success? && file_type.include?("text")
  end
  
  def self.accepted_file?(f)
    return true if ACCEPTED_EXTENSIONS.include? File.extname(f) or ACCEPTED_FILES.include?(f)
    false
  end

  def self.force_unicode(str)
    str.encode(Encoding.find('UTF-8'), {invalid: :replace, undef: :replace, replace: ''})
  end
end
