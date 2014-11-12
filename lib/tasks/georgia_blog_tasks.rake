namespace :georgia do

  namespace :blog do

    namespace :elasticsearch do

      desc 'Setup ElasticSearch indices'
      task setup: :environment do
        Georgia::Blog::Post.__elasticsearch__.client.indices.delete index: Georgia::Blog::Post.index_name rescue nil
        Georgia::Blog::Post.__elasticsearch__.create_index! force: true
        Georgia::Blog::Post.import
      end

    end

  end

end