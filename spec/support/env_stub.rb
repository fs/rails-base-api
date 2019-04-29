RSpec.configure do |config|
  config.before do
    allow(ENV).to receive(:fetch).with("ACTION_DISPATCH_REQUEST_ID").and_return("4eac02e2-6856-449b-bc28-fbf1b32a20f2")
  end
end
