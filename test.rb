require 'httparty'
require 'pp'
require 'json'

# ref: https://github.com/jnunemaker/httparty

class TestXanadu
  include HTTParty
  base_uri 'http://0.0.0.0:9292/'
end

options = {
  body: {
    # data: "This code is a ruby 1.9.x port of the Punkt sentence tokenizer algorithm implemented by the NLTK Project (http://www.nltk.org/). Punkt is a language-independent, unsupervised approach to sentence boundary detection. It is based on the assumption that a large number of ambiguities in the determination of sentence boundaries can be eliminated once abbreviations have been identiﬁed."
    data: "An UFO.  What?! M.I.B. 'Yes, M.I.B.'"
  }
}

pp TestXanadu.post('/', options)
