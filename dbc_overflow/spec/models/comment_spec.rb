require 'spec_helper'
describe Comment do
  it {should validate_presence_of(:commentable_type)}
  it {should validate_presence_of(:commentable_id)}
  it {should belong_to(:user)}
  it {should validate_presence_of(:content)}
end
