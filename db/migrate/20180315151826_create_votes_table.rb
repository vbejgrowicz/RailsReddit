class CreateVotesTable < ActiveRecord::Migration[5.1]
  def change
    create_table :votes do |t|
      t.integer :value, null: false
      t.timestamps
      t.references :votable, polymorphic: true, index: true
    end
  end
end
