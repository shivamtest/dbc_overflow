require 'spec_helper'

describe Answer do 
  it { should validate_presence_of(:content) }
  it { should ensure_length_of(:content).is_at_least(15) }
  it { should validate_presence_of(:question_id) }
  it { should validate_presence_of(:user_id) }
  it { should belong_to(:question) }
  it { should belong_to(:user) }
end
