def breadcrumb_codestream_package(codestream, package)
  "#{link_to(codestream,"/codestreams/#{codestream}/")} > #{link_to(package,"/codestreams/#{codestream}/packages/#{package}/")}"
end

def breadcrum_codestream(codestream)
  "#{link_to(codestream,"/codestreams/#{codestream}/")}"
end
