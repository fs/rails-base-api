shared_context "JSON API headers" do
  before(:each) do
    header "Accept", JSONAPI::MEDIA_TYPE
    header "Content-Type", JSONAPI::MEDIA_TYPE
    header "Host", "timebox-api.herokuapp.com"
  end
end
