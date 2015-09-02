require 'socket'

run Proc.new { |env|

  headers = env.select {|k,v| k.start_with? 'HTTP_'}
    .collect {|pair| [pair[0].sub(/^HTTP_/, ''), pair[1]]}
    .collect {|pair| pair.join(": ") << "<br>"}
    .sort

  headers << Socket::getaddrinfo(Socket.gethostname,"echo",Socket::AF_INET)[0][3]

  [200, {"Content-Type" => "text/html"}, headers]
}
