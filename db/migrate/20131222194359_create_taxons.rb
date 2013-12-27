class CreateTaxons < ActiveRecord::Migration
  def change
    create_table :taxons do |t|
      t.references :report, index: true
      t.string :name

      t.timestamps
    end
  end
end
