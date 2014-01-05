class NameValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /^[A-Z]/
      record.errors[attribute] << (options[:message] || I18n.t('no_initial_cap'))
    end
  end
end
 
class Taxon < ActiveRecord::Base
  validates :eol_id, presence: true
  validates :name, presence: true, name: true
  belongs_to :report
  has_many :taxon_data, dependent: :destroy
  
  def add_data(report_type, data)
    data.each do |k,v|
      v.each {|e| add_datum(report_type, k, e)}
    end
  end

  def add_datum(report_type, key, v)
    value = v.to_s
    td = TaxonDatum.where(taxon: self, report_type: report_type, key: key).first
    unless td and td.add_value(value)
      td = TaxonDatum.new(report_type: report_type, key: key, value: value)
      td.save
      taxon_data << td
    end
  end
  
  def data(site_data_type, key)
    TaxonDatum.where(taxon: self, report_type: site_data_type.to_s, key: key).map {|td| td.value}
  end
  
  def data_dump; "Taxon: #{name}(#{id}) [" + taxon_data.map {|td| td.data_dump}.join(', ') + "]"; end
  
  def name_link; link_to(name, "http://eol.org/#{id}"); end
end
