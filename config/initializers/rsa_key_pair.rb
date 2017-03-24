public_key_path = "#{Rails.root}/rsa_public.pem"
PUBLIC_KEY = OpenSSL::PKey::RSA.new(File.read(public_key_path))
private_key_path = "#{Rails.root}/rsa_private.pem"
password = ENV["RSA_PASSWORD"]
PRIVATE_KEY = OpenSSL::PKey::RSA.new(File.read(private_key_path), password)

