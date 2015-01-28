require 'sinatra'
require 'punkt-segmenter'
require 'sinatra/jsonp'
require 'json'
require 'pp'
require 'kramdown'

# set public_folder: File.dirname(__FILE__) + '/static'
# set static_cache_control: [:private, :max_age => 0]
before do

  expires 0, :private, :must_revalidate
  # 帮助
  # http://stackoverflow.com/questions/20734242/cross-domain-session-with-sinatra-and-angularjs
  headers['Access-Control-Allow-Methods'] = 'GET, POST, PUT, DELETE, OPTIONS'
  # headers['Access-Control-Allow-Origin'] = 'http://localhost:4567'
  headers['Access-Control-Allow-Origin'] = '*'
  headers['Access-Control-Allow-Headers'] = 'accept, authorization, origin'
  headers['Access-Control-Allow-Credentials'] = 'true'
end

get '/' do
  markdown :index
end

post '/' do
  logger.info "sb posted data"
  request.body.rewind  # in case someone already read it
  # data = JSON.parse request.body.read
  data = request[:data]
  tokenizer = Punkt::SentenceTokenizer.new(data)
  splitted = tokenizer.sentences_from_text(data, :output => :sentences_text)
  # pp splitted
  JSONP splitted
end
