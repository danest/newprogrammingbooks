Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, "101220679964388", "2906983a034835c3daf52c719542c6c6", {:scope => "email, offline_access"}
end