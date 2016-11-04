Rails.application.routes.draw do
  # devise için url yapılandırması
  devise_for :podcasts

  # kanallar için url yapılandırması
  resources :podcasts, only: [:index, :show] do
  	# kanallara ait bölümler ve onların işlemleri için url yapılandırması
  	resources :episodes
  end

  # auth işleminden sonra yönlendirme yapılacak url
  authenticated :podcast do
  	root "podcasts#dashboard", as: "authenticated_root"
  end

  # root url yapılandırması
  root "welcome#index"

  # 404 yerine anasayfaya yönlendirme yapıyoruz
  get '*path' => redirect('/')
end
