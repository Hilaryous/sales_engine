require_relative './parser'

class Transaction
  include Parser

  attr_reader :id,
              :invoice_id,
              :credit_card_number,
              :result,
              :created_at,
              :updated_at,
              :transaction_repository

  def initialize(data,repo)
    @id                     = data[:id]
    @invoice_id             = data[:invoice_id]
    @credit_card_number     = data[:credit_card_number]
    @result                 = data[:result]
    @created_at             = date(data[:created_at])
    @updated_at             = date(data[:updated_at])
    @transaction_repository = repo
    @transaction_repository.objects << self
  end

  def invoices
    transaction_repository.find_invoices(id)
  end
end
