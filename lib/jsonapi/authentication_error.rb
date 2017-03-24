module JSONAPI
  class AuthenticationError < JSONAPI::Exceptions::Error
    def self.code
      "401"
    end

    def self.errors
      [JSONAPI::Error.new(
        code: code,
        status: :unauthorized,
        title: "Unauthorized",
        detail: "You need to sign in or sign up before continuing")]
    end
  end
end
