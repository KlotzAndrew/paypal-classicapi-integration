class Ticket < ActiveRecord::Base

	# serialize :notification_params, Hash
	def paypal_url(return_path,root_url)
		values = { 
		:business => 'test_seller@seller.com',
		:cmd => '_cart',
		:upload => 1,
		:return => root_url + return_path,
		:invoice => self.id,
		:notify_url => root_url + 'hook',
		:amount_1 => '10',
		:currency_code => 'CAD',
		:item_name_1 => self.name,
		:item_number_1 => 'League 1A',
		:quantity_1 => '1'
		}

		"https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query
	end

	def fire_test
		Rails.logger.info "#{app.root_url}"
	end

end
