require 'rails_helper'

RSpec.describe Image, type: :model do
  context 'Columns' do
    it { should have_db_column(:imageable_type).of_type(:string) }
    it { should have_db_column(:imageable_id).of_type(:integer) }
  end

  context 'Associations' do
    it { should belong_to(:imageable) }
  end
end
