class NameValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /^[A-Z]/
      record.errors[attribute] << (options[:message] || "does not start with a capital letter")
    end
  end
end
 
class Taxon < ActiveRecord::Base
  validates :eol_id, presence: true
  validates :name, presence: true, name: true
  belongs_to :report
  has_many :taxon_data
  
  def add_data(report_type, data)
    data.each do |k,v|
      if v.class == Array
        v.each {|e| add_datum(report_type, k, e)}
      else
        add_datum(report_type, k, v)
      end
    end
  end
  
  def add_datum(report_type, key, value)
    td = TaxonDatum.new(report_type: report_type, key: key, value: value.to_s)
    td.save
    taxon_data << td
  end
  
  def data(site_data_type, key)
    TaxonDatum.where(taxon: self, report_type: site_data_type.to_s, key: key).map {|td| td.value}
  end
  
  def data_dump; "Taxon: #{name}(#{id}) [" + taxon_data.map {|td| td.data_dump}.join(', ') + "]"; end
end
