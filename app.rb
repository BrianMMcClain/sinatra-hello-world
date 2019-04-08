require 'sinatra'

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
	ret = ""
	ENV.keys.each do |k|
		ret += "<b>#{k}</b>: #{ENV[k]}<br />"
	end

	return ret
end
