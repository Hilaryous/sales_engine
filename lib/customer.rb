require 'parser'
class Customer
  include Parser

  attr_reader :id,
              :first_name,
              :last_name,
              :created_at,
              :updated_at,
              :customer_repository
  def initialize(data, repo)
    @id         = data[:id]
    @first_name = data[:first_name]
    @last_name  = data[:last_name]
    @created_at = date(data[:created_at])
    @updated_at = date(data[:updated_at])
    @customer_repository = repo
  end

  def invoices
    customer_repository.find_invoices(id)
  end
end
