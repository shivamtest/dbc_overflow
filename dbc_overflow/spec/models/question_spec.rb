require 'spec_helper'

describe Question do 
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:content) }
  it { should validate_presence_of(:user_id) }
  it { should ensure_length_of(:title).is_at_least(15).is_at_most(100)}
  it { should ensure_length_of(:content).is_at_least(100)}

end