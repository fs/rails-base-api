public_key_path = Rails.root.join("rsa_public.pem")
private_key_path = Rails.root.join("rsa_private.pem")
if password = ENV.fetch("RSA_PASSWORD", nil) && File.exist?(public_key_path) && File.exist?(private_key_path)
  RSA_PUBLIC_KEY = OpenSSL::PKey::RSA.new(File.read(public_key_path))
  RSA_PRIVATE_KEY = OpenSSL::PKey::RSA.new(File.read(private_key_path), password)
else
  RSA_PRIVATE_KEY = OpenSSL::PKey::RSA.generate(2048)
  RSA_PUBLIC_KEY = RSA_PRIVATE_KEY.public_key
end
