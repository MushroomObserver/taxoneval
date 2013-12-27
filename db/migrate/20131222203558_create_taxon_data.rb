class CreateTaxonData < ActiveRecord::Migration
  def change
    create_table :taxon_data do |t|
      t.references :taxon, index: true
      t.string :report_type
      t.string :key
      t.string :value

      t.timestamps
    end
  end
end
