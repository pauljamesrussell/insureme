class API < Grape::API
  # version 'v1', using: :header, vendor: 'insureme'
  format :json

  helpers do
    def warden
      env['warden']
    end

    def authenticated
      return true if warden.authenticated?
      params[:access_token] && @user = User.find_by_authentication_token(params[:access_token])
    end

    def current_user
      warden.user || @user
    end
  end

  resource :profile do
    desc "Return the user's profile"
    get do
      current_user
    end
  end
end