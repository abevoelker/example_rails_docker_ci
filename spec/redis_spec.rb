require 'spec_helper'
require 'redis'

describe 'redis' do

  before do
    @redis = Redis.new
  end

  it 'can SET and GET a key' do
    expect(@redis.set("foo", "bar")).to eq("OK")
    expect(@redis.get("foo")).to        eq("bar")
  end
end
