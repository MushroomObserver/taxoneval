class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.string :taxon
      t.timestamps
    end
  end
end
