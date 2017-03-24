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
        detail: I18n.t("devise.failure.unauthenticated"))]
    end
  end
end
