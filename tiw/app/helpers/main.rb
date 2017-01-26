def breadcrumb_codestream_package(codestream, package)
   breadcrumb_codestream(codestream) + " > #{link_to(package,"/codestreams/#{codestream}/packages/#{package}/")}"
end

def breadcrumb_codestream(codestream)
  "#{link_to(codestream,"/codestreams/#{codestream}/")}"
end

def build_file_path(f)
  url("/codestreams/#{f.package.codestream.name}/packages/#{f.package.name}/package_files/package_file?path=#{f.path}")
end
