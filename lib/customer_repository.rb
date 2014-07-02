require './lib/finder'

class CustomerRepository
  include Finder
  def self.from_file(file_name='./data/customers.csv', engine)
    customers = Loader.read(file_name, Customer, self)
    new(customers, engine)
  end

  attr_reader :objects, :sales_engine
  def initialize(customers, engine)
    @objects = customers
    @sales_engine = engine
  end
end