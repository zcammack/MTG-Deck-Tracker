class AddTablesToDecks < ActiveRecord::Migration[6.0]
  def change
    add_column :decks, :imageurls, :string
    add_column :decks, :cardtypes, :string
    add_column :decks, :cardtypes, :string
  end
end
