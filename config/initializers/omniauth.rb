Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, 'b2dede0d513636f44e56c789bd0314f9', '7ec83983031f2f971b3b820fc47cea13'
end