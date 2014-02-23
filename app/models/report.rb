class Report < ActiveRecord::Base
  validates :name, presence: true
  has_many :taxons, -> { order(:name) }, dependent: :destroy
  
  def add_taxon_name(name)
    @report = TaxonReporter.report(name)
    @report.taxons.each {|t| add_taxon(t) }
    self
  end
  
  def add_taxon(tr_taxon)
    taxon = Taxon.new(:eol_id => tr_taxon.values("EOL:eol_id").first, :name => tr_taxon.values("EOL:scientificName").first)
    if taxon.valid?
      taxon.save
      taxon.add_records(tr_taxon.records)
      taxons << taxon
      taxon
    end
  end
  
  def fields; ["ranks", "richness"]; end
  
  def headers
    [I18n.t('taxa')] + fields.map{|f| I18n.t(f)}
  end
  
  def taxon_items(field=[], ascending=true)
    taxons.map { |t| [[t.name, "http://eol.org/#{t.eol_id}"]] + fields.map {|f| t.data("EolData", f).join(", ")} }
  end
  
  def data_dump
    taxons.map {|t| t.data_dump}.join(', ')
  end
end
