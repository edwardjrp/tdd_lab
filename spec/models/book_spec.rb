require 'rails_helper'

RSpec.fdescribe Book, type: :model do
  it 'fails to create an empty book' do
    book = FactoryGirl.build(:book)
    expect(book.save).to be_falsey
  end
end
