require 'rails_helper'

RSpec.describe School, type: :model do
    describe 'validations' do 
        it { should validate_presence_of(:name)}
        it { should validate_presence_of(:national_rank)}
        it { should allow_value(true). for(:ap_program)}
        it { should allow_value(false). for(:ap_program)}
    end 
    
    describe 'relationships' do 
        it { should have_many :students}
    end
end