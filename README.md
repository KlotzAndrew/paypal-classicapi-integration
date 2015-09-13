#PayPal Classic API Integration
If you do not want to touch payment information, use the PayPal classic API. This is working code for a rails app. Redirects user to paypal business payment portal with your params. Code has option for self-signed SSL encryption on outbound paypal requests.


Includes handler for IPN callback. PayPal docs say they should fire a 2nd callback with either 'VALID' or 'INVALID' for extra precaution, but this has never happend. Docs have very little info, so maybe it is no longer being sent. 
