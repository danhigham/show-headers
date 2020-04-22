require 'socket'
require 'rack/deflater'

use Rack::Deflater

run Proc.new { |env|

  headers = env
    .collect {|pair| pair.join(": ") << "<br>"}
    .sort.join

  env_vars = ENV
    .collect {|pair| pair.join(": ") << "<br>"}
    .sort.join

  headers << "---<br>" << env_vars
  sleep(1.5) 
  [200, {"Content-Type" => "text/html"}, [headers]]
}
