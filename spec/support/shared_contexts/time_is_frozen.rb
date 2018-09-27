shared_context "with frozen time" do
  let(:current_time) { Time.current }

  before { Timecop.freeze(current_time) }

  after { Timecop.return }
end
