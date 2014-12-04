require 'spec_helper'
require 'elasticsearch/persistence'

describe 'elasticsearch' do

  before do
    @repository = Elasticsearch::Persistence::Repository.new
  end

  it 'can PUT and GET' do
    note = Note.new(id: 1, text: 'Test')
    expect(@repository.save(note)).to be_truthy
    expect(@repository.find(1)).to    be_a(Note)
  end
end
