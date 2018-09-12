shared_examples "failure interactor" do |params|
  it "fails" do
    interactor.run
    expect(context).to be_failure
    expect(context.message).to eql(params[:message]) if params
  end
end
