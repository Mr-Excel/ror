require 'rails_helper'

RSpec.describe User, type: :model do

  # registrations checing
  describe "registrations" do
    it "should create a new user" do 
      before_count = User.count
      user = create(:user, :gender => 1)
      after_count = User.count
      expect(before_count+1).to be(after_count)
    end
  end

  # methods testing
   describe "#age" do
      context "when date_of_birth is nil" do
        it "returns nil" do
          model = create(:user, date_of_birth: nil)
          expect(model.age).to be_nil
        end
      end
      
      context "when date_of_birth is in the past" do
        it "calculates age correctly" do
          date_of_birth = Date.today - 30.years
          model = create(:user, date_of_birth: date_of_birth)
          expect(model.age).to eq(30)
        end
      end
      
      context "when date_of_birth is in the future" do
        it "returns 0" do
          date_of_birth = Date.today + 1.year
          model = create(:user, date_of_birth: date_of_birth)
          expect(model.age).to eq(0)
        end
      end
    end

  # validations testing
  describe "validations" do
    context "should validate all attributes while creating a new user" do
      # creating a user
      let!(:user) { create(:user) }

      # validating not null check
      it { should validate_presence_of(:gender) }
      it { should validate_presence_of(:email) }
      it { should validate_presence_of(:first_name) }
      it { should validate_presence_of(:last_name) }

      # checking email to be unique and present
      it "requires email to be unique" do
        new_user = build(:user, email: user.email)
        expect(new_user).not_to be_valid
      end
    end
  end
end
 