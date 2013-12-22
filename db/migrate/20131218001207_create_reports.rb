class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.string :taxon
      t.integer :eol_id

      t.timestamps
    end
  end
end
