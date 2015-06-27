class CreateCommand < ActiveRecord::Migration
  def change
    create_table :commands do |t|
      t.string :command
      t.string :source
      t.string :target
    end
  end
end
