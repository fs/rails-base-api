# allow send emails to the @example.com
#
MailSafe::Config.internal_address_definition = /^.*@example\.com$/i if defined?(MailSafe::Config)
