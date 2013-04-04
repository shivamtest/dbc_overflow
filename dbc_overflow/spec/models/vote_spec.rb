require 'spec_helper'

describe Vote do
  it { should belong_to(:votable) }        
  it { should validate_presence_of(:votable_id) }
  it { should validate_presence_of(:votable_type) }
  it { should_not allow_value("string").for(:description)}
  it { should_not allow_value(0).for(:description)}

  ["Question", "Answer"].each do |q|
    it { should allow_value(q).for(:votable_type)}
  end

  it { should_not allow_value("random").for(:votable_type) }
end
