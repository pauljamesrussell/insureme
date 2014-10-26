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
                                 :only => [:insurance_type,:price] } },:only => [:email,:first_name,:surname,:image])
	 JSON.parse(jsonVal).first
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
		if current_user.insurances !=nil
  	    current_user.insurances.delete_all
		end
		current_user.save
		current_user.insurances = Array.new
		data.each do |x|
			insurance = Insurance.new
			insurance.insurance_type=x["type"]
			insurance.enabled = true
			insurance.price = 1.98			
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

  resource :quote do
    desc "Return the user's profile"
    post do
		data = JSON.parse(params['data'].to_json)
		prices = Array.new
		discounts = [0,0,0.05,0.08,0.11,0.14,0.17,0.20]
		discount =discounts[data.size]
		puts discount
		total = 0
		result = Hash.new
		data.each do |x|
			insurance_type=x["type"]
			insurance_details = x["details"]
			price = 1.98 # to use api
			prices << price
			total += price
			result[insurance_type] = price
		end	
		result["total"] = (1-discount)*total
		result["discount"] = discount*total
		result
    end
  end
  
end