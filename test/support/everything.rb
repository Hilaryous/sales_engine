class Everything
  attr_reader :name,
              :id,
              :created_at,
              :updated_at,
              :first_name,
              :last_name,
              :item_id,
              :quantity,
              :unit_price,
              :customer_id,
              :merchant_id,
              :status,
              :invoice_id,
              :credit_card_number,
              :result
              :everything_repo

  def initialize(data, repo)
    @name        = data[:name]
    @id          = data[:id]
    @created_at  = data[:created_at]
    @updated_at  = data[:updated_at]
    @first_name  = data[:first_name]
    @last_name   = data[:last_name]
    @item_id     = data[:item_id]
    @quantity    = data[:quantity]
    @unit_price  = data[:unit_price]
    @customer_id = data[:customer_id]
    @merchant_id = data[:merchant_id]
    @status      = data[:status]
    @invoice_id  = data[:invoice_id]
    @credit_card_number = data[:credit_card_number]
    @result      = data[:result]
    @everything_repo = repo
  end
end

class EverythingRepository
  include Finder
  def self.from_file(file_name='./test/fixtures/everything.csv', klass, engine)
    thing = Loader.read(file_name, Everything, self)
    new(thing, engine)
  end

  attr_reader :objects, :sales_engine
  def initialize(thing, engine)
    @objects = thing
    @sales_engine = engine
  end
end