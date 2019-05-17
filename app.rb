require 'sinatra'
require 'json'

get '/' do	
	name = params["name"] || "World"
	ret = <<-EOF
	<html>
		<head>
			<title>Sinatra - Hello World!</title>
		</head>
		<body>
			<h1>Hello, #{name}!</h1>
		</body>
	</html>
	EOF

	return ret
end

get '/env' do
	internalIP = ENV["CF_INSTANCE_IP"] || "0.0.0.0"
	internalPort = "0"
	if not ENV["CF_INSTANCE_PORTS"].nil?
		internalPort = JSON.parse(ENV["CF_INSTANCE_PORTS"])[0]["external_tls_proxy"]
	end

	ret = "<h1>#{internalIP}:#{internalPort}</h1><br /><br />"
	ENV.keys.each do |k|
		ret += "<b>#{k}</b>: #{ENV[k]}<br />"
	end

	return ret
end
