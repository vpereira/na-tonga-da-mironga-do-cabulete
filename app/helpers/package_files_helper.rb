module PackageFilesHelper
  # TODO
  # js code is rendering wrong.. unsafe?
  # use RedCloth
  def print_source_code(c,t)
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, fenced_code_blocks: true, autolink: true)
    markdown.render CodeRay.scan(c,t).div(:line_numbers => :table)
  end
end
