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
	
	 user = User.includes(:insurances, insurances: [:insurance_details]).where(id: current_user.id)
	 jsonVal = user.to_json(:include => { :insurances => {
                                 :include => { :insurance_details => {
                                               :only => [:name,:value]	 } },
                                 :only => :insurance_type } })
	 JSON.parse(jsonVal)
    end
  end
  
  resource :insurances do
    desc "Return the user's insurances"
    get do
      current_user.insurances
    end
  end

  resource :buy do
    desc "Return the user's profile"
    post do
		data = JSON.parse(params['data'].to_json)
  	    current_user.insurances.delete_all
		current_user.save
		current_user.insurances = Array.new
		data.each do |x|
			insurance = Insurance.new
			insurance.insurance_type=x["type"]
			insurance.enabled = true
			insurance.insurance_details = Array.new
			puts x["type"] 
			x["details"].each do |key, value|
				insuranceDetail = InsuranceDetail.new
				insuranceDetail.name = key
				insuranceDetail.value = value
				insurance.insurance_details << insuranceDetail	
			puts  key
			puts  value
			end
			current_user.insurances << insurance
		end	
    end
  end
  
end