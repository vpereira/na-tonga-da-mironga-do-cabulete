Tiw::App.controllers do

  get '/' do
    redirect '/codestreams'
  end

  get '/search' do
    puts "FOO",params.inspect

    if params["q"]
      puts params["q"]
      @package_files = PackageFile.search_by_content(params["q"]) # .with_pg_search_highlight
    end
    slim :'codestreams/search'
  end

  get '/codestreams' do
    @codestreams = Codestream.all
    slim :'codestreams/index'
  end

  get '/codestreams/:codestream','/codestreams/:codestream/packages' do
    @codestream = Codestream.find_by(name: params[:codestream])
    slim :'codestreams/show'
  end

  get '/codestreams/:codestream/packages/:package', '/codestreams/:codestream/packages/:package/package_files' do
    @codestream = Codestream.find_by(name: params[:codestream])
    @package = @codestream.packages.find_by(name:params[:package])
    slim :'packages/show'
  end

  get '/codestreams/:codestream/packages/:package/package_files/package_file' do
    @codestream = Codestream.find_by(name: params[:codestream])
    @package = @codestream.packages.find_by(name:params[:package])
    @package_file = @package.package_files.find_by(path:params[:path])
    slim :'package_files/show'
  end
end
