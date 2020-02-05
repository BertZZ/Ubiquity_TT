require 'rails_helper'

describe User do
  subject { FactoryBot.create(:user) }

  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email)}

  it 'does not store the password as plain text' do
    puts subject.password_digest
    expect(subject.password_digest).not_to eq('Potato123!')
  end
end
