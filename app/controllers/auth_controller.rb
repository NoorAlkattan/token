class AuthController < ApplicationController
# App's client ID. Register the app in Application Registration Portal to get this value.
 CLIENT_ID = '6586e42d-17ca-4ad5-a5d6-451fd617c364'
  # App's client secret. Register the app in Application Registration Portal to get this value.
 CLIENT_SECRET = '/oNcXIhStDnE9/HZG/Btv8iwVd0ArMZ5JdConc5Bj+k='

  # Scopes required by the app
  SCOPES = [ 'openid',
            'https://login.microsoftline.com' ]
  
  REDIRECT_URI = 'http://localhost:3000/authorize' # Temporary!

  # Generates the login URL for the app.
  #def get_login_url
   # client = OAuth2::Client.new(CLIENT_ID,
                            #    CLIENT_SECRET,
                             #   :site => 'https://login.microsoftonline.com',
                             #   :authorize_url => 'https://login.microsoftonline.com/noorsamiryahoo.onmicrosoft.com/oauth2/authorize?resource=https://noorsamiryahoo.onmicrosoft.com/22051cb7-dd91-4476-b786-2df28500d75b',
                             #   :token_url => 'https://login.microsoftonline.com/noorsamiryahoo.onmicrosoft.com/oauth2/token')
                              
    #login_url = client.auth_code.authorize_url(:redirect_uri => REDIRECT_URI, :scope => SCOPES.join(' '))
                              # render text: "get_login_url: #{login_url}, Code: #{params[:code]}"
 # end
  
 #def get_token_from_code(auth_code)
  #client = OAuth2::Client.new(CLIENT_ID,
                              #CLIENT_SECRET,
                             # :site => 'https://login.microsoftonline.com',
                             # :authorize_url => 'https://login.microsoftonline.com/noorsamiryahoo.onmicrosoft.com/oauth2/authorize?resource=https://noorsamiryahoo.onmicrosoft.com/22051cb7-dd91-4476-b786-2df28500d75b',
                             # :token_url => 'https://login.microsoftonline.com/noorsamiryahoo.onmicrosoft.com/oauth2/token')

  #token = client.auth_code.get_token(auth_code,
                                    # :redirect_uri => authorize_url,
                                    # :scope => SCOPES.join(' '))
                                     
# end                                                     
  

 #def get_token
 #  token = get_token_from_code params[:code]
 #  render text: "ACCESS-TOKEN: #{token.token}"

 #end
#end


 def check_access_token
 # Get the current token hash from session
  token_hash = params[:azure_token]  
  client = OAuth2::Client.new(CLIENT_ID,
                             CLIENT_SECRET,
                             :site => 'https://login.microsoftonline.com',
                             :authorize_url => 'https://login.microsoftonline.com/noorsamiryahoo.onmicrosoft.com/oauth2/authorize?resource=https://noorsamiryahoo.onmicrosoft.com/22051cb7-dd91-4476-b786-2df28500d75b',
                             :token_url => 'https://login.microsoftonline.com/noorsamiryahoo.onmicrosoft.com/oauth2/token')  token = OAuth2::AccessToken.from_hash(client, token_hash)  # Check if token is expired, refresh if so
  if token.expired?
   puts "expired"
  else
   puts 'valid'
  end
  end
 end




























