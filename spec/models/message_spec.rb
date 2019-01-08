require 'rails_helper'

RSpec.describe Message, type: :model do
  describe 'Should Respond' do
    it { should respond_to(:email) }
    it { should respond_to(:first_name) }
    it { should respond_to(:last_name) }
    it { should respond_to(:amount) }
    it { should respond_to(:created_at) }
    it { should respond_to(:updated_at) }
  end

  describe 'Validations' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:amount) }
    it { should validate_uniqueness_of(:email) }
  end
end
