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

helpers do
  def parse_sentence(params, option = :sentence_text)
    data = params[:data]
    tokenizer = Punkt::SentenceTokenizer.new(data)
    tokenizer.sentences_from_text(data, output: option)
  end

  def remove_stop_words(arry_of_words)
    stop_words = ["a", "able", "about", "across", "after", "all", "almost", "also", "am", "among", "an", "and", "any", "are", "as", "at", "be", "because", "been", "but", "by", "can", "cannot", "could", "dear", "did", "do", "does", "either", "else", "ever", "every", "for", "from", "get", "got", "had", "has", "have", "he", "her", "hers", "him", "his", "how", "however", "i", "if", "in", "into", "is", "it", "its", "just", "least", "let", "like", "likely", "may", "me", "might", "most", "must", "my", "neither", "no", "nor", "not", "of", "off", "often", "on", "only", "or", "other", "our", "own", "rather", "said", "say", "says", "she", "should", "since", "so", "some", "than", "that", "the", "their", "them", "then", "there", "these", "they", "this", "tis", "to", "too", "twas", "us", "wants", "was", "we", "were", "what", "when", "where", "which", "while", "who", "whom", "why", "will", "with", "would", "yet", "you", "your", "1"]
    arry_of_words.reject { |e| stop_words.include? e}
  end
end

get '/' do
  markdown :index
end

get '/api/v1' do
  markdown :'api_v1'
end

post '/sentence_text' do
  logger.info 'sb posted data to /sentence_text'
  data = params[:data]
  tokenizer = Punkt::SentenceTokenizer.new(data)
  r = tokenizer.sentences_from_text(data, output: :sentences_text)
  JSONP r

end

post '/sentence_token' do
  logger.info 'sb posted data to /sentence_token'
  JSONP parse_sentence(params, :tokenized_sentences)
end

post '/word_frequency' do
  logger.info 'sb posted data to /sentence_token'
  all_words = parse_sentence(params, :tokenized_sentences).flatten.map(&:downcase)
  words = remove_stop_words all_words
  freq = words.each_with_object(Hash.new { |h, k| h[k] = 0 }) do |e, o|
    o[e] = o[e] + 1
  end
  JSONP freq
end
