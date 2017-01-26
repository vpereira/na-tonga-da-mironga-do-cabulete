def breadcrumb_codestream_package(codestream, package)
   breadcrumb_codestream(codestream) + " > #{link_to(package,"/codestreams/#{codestream}/packages/#{package}/")}"
end

def breadcrumb_codestream(codestream)
  "#{link_to(codestream,"/codestreams/#{codestream}/")}"
end
