class CreateDecks < ActiveRecord::Migration[6.0]
  def change
    create_table :decks do |t|
      t.string :name
      t.string :list_of_cards
      t.integer :user_id

      t.timestamps
    end
  end
end
