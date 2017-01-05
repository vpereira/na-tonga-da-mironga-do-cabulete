module PackageFilesHelper
  # TODO
  # js code is rendering wrong.. unsafe?
  # use RedCloth
  def print_source_code(c,t)
    CodeRay.scan(c,t).div(:line_numbers => :inline, :wrap=>:div)
  end
end
