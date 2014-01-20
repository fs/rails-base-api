module SkipTrackable
  extend ActiveSupport::Concern

  included do
    prepend_before_filter :skip_trackable
  end

  def skip_trackable
    request.env['devise.skip_trackable'] = true
  end
end
