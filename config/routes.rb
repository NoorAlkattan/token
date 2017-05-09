Rails.application.routes.draw do

#get 'authorize' => 'auth#get_login_url'
post 'auth' => 'auth#check_access_token'
end 

  