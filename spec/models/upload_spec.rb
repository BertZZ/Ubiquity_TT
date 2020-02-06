require 'rails_helper'

describe Upload do
  subject { FactoryBot.create(:upload) }

  it { should validate_presence_of(:original_filename) }
  it { should validate_presence_of(:filename) }
  it { should validate_presence_of(:url) }

  it { should belong_to(:user) }

end
