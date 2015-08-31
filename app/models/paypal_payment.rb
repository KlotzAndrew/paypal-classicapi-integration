class PaypalPayent
	
	

	PayPal::SDK::REST.set_config(
	  :mode => "sandbox", # "sandbox" or "live"
	  :client_id => "EBWKjlELKMYqRNQ6sYvFo64FtaRLRR5BdHEESmha49TM",
	  :client_secret => "EO422dn3gQLgDbuwqTjzrFgFtaRLRR5BdHEESmha49TM")

	# Build Payment object
	@payment = Payment.new({
	  :intent => "sale",
	  :payer => {
	    :payment_method => "credit_card",
	    :funding_instruments => [{
	      :credit_card => {
	        :type => "visa",
	        :number => "4567516310777851",
	        :expire_month => "11",
	        :expire_year => "2018",
	        :cvv2 => "874",
	        :first_name => "Joe",
	        :last_name => "Shopper",
	        :billing_address => {
	          :line1 => "52 N Main ST",
	          :city => "Johnstown",
	          :state => "OH",
	          :postal_code => "43210",
	          :country_code => "US" }}}]},
	  :transactions => [{
	    :item_list => {
	      :items => [{
	        :name => "item",
	        :sku => "item",
	        :price => "1",
	        :currency => "USD",
	        :quantity => 1 }]},
	    :amount => {
	      :total => "1.00",
	      :currency => "USD" },
	    :description => "This is the payment transaction description." }]})

	# Create Payment and return the status(true or false)
	def initialize
		if @payment.create
		  @payment.id     # Payment Id
		else
		  @payment.error  # Error Hash
		end
	end
end