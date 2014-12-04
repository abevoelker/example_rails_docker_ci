require 'spec_helper'

describe Product do

  it 'can INSERT and SELECT into Postgres database' do
    expect(Product.create).to be_truthy
    expect(Product.count).to  eq(1)
  end

end
