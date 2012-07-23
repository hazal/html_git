require "sinatra"


get "/" do
  haml :index
end

get "/kitap/:n" do |number|
  if File.exist?("./views/kitap_#{number}.haml")
    haml :"kitap_#{number}"
  else
    haml :"405"
  end
end

get "/k_search" do
  @kelime = params[:search_str]
  @start = params[:start]
  @end = params[:end]
  haml :k_search
end

get "/email/:name" do |isim|
  haml :email, :locals => {:isim => isim}
end

get "/:sayfa" do |s|
  if File.exist?("./views/#{s}.haml")
    haml :"#{s}"
  else
    haml :"404"
  end
end

  