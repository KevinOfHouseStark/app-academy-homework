class CreateShortenedURLs < ActiveRecord::Migration[5.1]
  def change
    create_table :shortened_urls do |t|
      t.string :long_url, null: false
      t.string :short_url, null: false
      t.integer :submitter_id, null: false
    end
  end
end
