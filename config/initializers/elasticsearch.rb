unless Rails.env.test?
  Tire.configure do
    url ENV['ELASTICSEARCH_URL']
  end
end

# hash_filter = {
#   type: "word_delimiter",
#   type_table: ["# => ALPHA"]
# }

HASHTAG_OPTIONS = { autocomplete: ["tags"],
                    settings: {
                      analysis: {
                        analyzer: {
                          searchkick_keyword: {
                            type: "custom",
                            tokenizer: "whitespace",
                            filter:["hash_filter","lowercase", "snowball"]
                          },
                          default_index: {
                            type: "custom",
                            tokenizer: "whitespace",
                            # synonym should come last, after stemming and shingle
                            # shingle must come before snowball
                            filter: ["hash_filter", "lowercase", "asciifolding", "stop", "searchkick_index_shingle", "snowball"]
                          },
                          searchkick_search: {
                            type: "custom",
                            tokenizer: "whitespace",
                            filter: ["hash_filter", "lowercase", "asciifolding", "stop", "searchkick_search_shingle", "snowball"]
                          },
                          searchkick_search2: {
                            type: "custom",
                            tokenizer: "whitespace",
                            filter: ["hash_filter", "lowercase", "asciifolding", "stop", "snowball"]
                          },
                          searchkick_autocomplete_index: {
                            type: "custom",
                            tokenizer: "standard",
                            filter: ["hash_filter", "standard", "lowercase", "asciifolding", "searchkick_autocomplete_ngram" ]
                          },
                          searchkick_autocomplete_search: {
                            type: "custom",
                            tokenizer: "standard",
                            filter: ["hash_filter", "standard", "lowercase", "asciifolding"]
                          },
                          searchkick_suggest_index: {
                            type: "custom",
                            tokenizer: "standard",
                            filter: ["hash_filter","lowercase", "asciifolding", "searchkick_suggest_shingle"]
                          }
                        },
                        filter: {
                          hash_filter: {
                            type: "word_delimiter",
                            type_table: ["# => ALPHA"]
                          },
                          searchkick_autocomplete_ngram: {
                            type: "edgeNGram",
                            max_gram: 15,
                            min_gram: 1
                          },
                          searchkick_index_shingle: {
                            type: "shingle",
                            token_separator: ""
                          },
                          # lucky find http://web.archiveorange.com/archive/v/AAfXfQ17f57FcRINsof7
                          searchkick_search_shingle: {
                            type: "shingle",
                            token_separator: "",
                            output_unigrams: false,
                            output_unigrams_if_no_shingles: true
                          },
                          searchkick_suggest_shingle: {
                            type: "shingle",
                            max_shingle_size: 5
                          }
                        },
                      }
                    }
                    }
