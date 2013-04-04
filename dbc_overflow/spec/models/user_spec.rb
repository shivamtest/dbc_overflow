require 'spec_helper'

describe User do
  it { should validate_presence_of(:name)}
  it { should validate_uniqueness_of(:email)}
  it { should validate_presence_of(:email)}
  it { should validate_format_of(:email).not_with("test@test")}
  it { should validate_format_of(:email).with("jhw1202@gmail.com")}
  it { should validate_presence_of(:password)}
  it { should validate_presence_of(:password_confirmation)}

  it { should have_many(:questions) }
  it { should have_many(:answers) }
  it { should have_many(:comments)}
end
