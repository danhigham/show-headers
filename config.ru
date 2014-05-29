run Proc.new { |env|

  headers = env.select {|k,v| k.start_with? 'HTTP_'}
    .collect {|pair| [pair[0].sub(/^HTTP_/, ''), pair[1]]}
    .collect {|pair| pair.join(": ") << "<br>"}
    .sort

  [200, {"Content-Type" => "text/html"}, headers]
}
