public_key_path = Rails.root.join("rsa_public.pem")
RSA_PUBLIC_KEY = OpenSSL::PKey::RSA.new(File.read(public_key_path))
private_key_path = Rails.root.join("rsa_private.pem")
password = ENV["RSA_PASSWORD"]
RSA_PRIVATE_KEY = OpenSSL::PKey::RSA.new(File.read(private_key_path), password)
