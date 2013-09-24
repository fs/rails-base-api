if defined? ApiTaster
  ApiTaster.global_params = { format: :json }
  ApiTaster.route_path = Rails.root.join('lib', 'api_tasters')
end
