shared_examples "success interactor" do
  it "success" do
    interactor.run
    expect(context).to be_success
  end
end
