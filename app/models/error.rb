class Error
  attr_reader :errors

  def initialize(messages = {})
    @errors = ActiveModel::Errors.new(self)
    messages.each { |attribute, message| @errors.add(attribute, message) }
  end
end
