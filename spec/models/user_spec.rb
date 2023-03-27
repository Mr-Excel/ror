require 'rails_helper'

RSpec.describe User, type: :model do

  # Coving Tests in this file
  # ** Creation of Object
  # ** Methods
  # ** Validations
  # ** Enums
  # ** Scope
  # ** Associations 
  # ** Indexing



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

  # Enums Testing
  describe "enums" do 
    it { should define_enum_for(:gender) }
  end
  
  # Scope Testing
  describe "scopes" do 
    it "should return all active teams" do 
      user = create(:user)
      teams = create_list(:team, 2)
      teams_2 = create_list(:team, 3)
      user_teams = teams.map { |team| create(:user_team, user: user, team: team) }
      user_teams_2 = teams_2.map { |team| create(:user_team, user: user, team: team, is_active: false) }
      expect(User.teams(1).count).to eq(2)
    end

    it "should return in active teams" do 
      user = create(:user)
      teams = create_list(:team, 2)
      teams_2 = create_list(:team, 3)
      user_teams = teams.map { |team| create(:user_team, user: user, team: team) }
      user_teams_2 = teams_2.map { |team| create(:user_team, user: user, team: team, is_active: false) }
      expect(User.teams(0).count).to eq(3)
    end


    it "should return in all associated teams" do 
      user = create(:user)
      teams = create_list(:team, 5)
      user_teams = teams.map { |team| create(:user_team, user: user, team: team) }
      expect(User.teams.count).to eq(teams.count)
    end

    it "should use scope for columns selection" do 
      user = create(:user)
      teams = create_list(:team, 5)
      user_teams = teams.map { |team| create(:user_team, user: user, team: team) }
      expect(User.select_all.size).to eq(5)
    end

    # checking male scope
    it "should return only males" do 
      create(:user, :gender => 0)
      create(:user, :gender => 0)
      create(:user, :gender => 0)
      create(:user, :gender => 0)
      create(:user, :gender => 0)
      create(:user, :gender => 0)
      create(:user, :gender => 1)
      create(:user, :gender => 1)
      create(:user, :gender => 1)
      create(:user, :gender => 1)
      male_counts = User.where(:gender => 0).count
      male_counts_from_scope = User.males.count
      expect(male_counts).to eq(male_counts_from_scope)
    end
    # checking female scope
    it "should return only females" do 
      create(:user, :gender => 0)
      create(:user, :gender => 0)
      create(:user, :gender => 0)
      create(:user, :gender => 0)
      create(:user, :gender => 0)
      create(:user, :gender => 0)
      create(:user, :gender => 1)
      create(:user, :gender => 1)
      create(:user, :gender => 1)
      create(:user, :gender => 1)
      male_counts = User.where(:gender => 1).count
      male_counts_from_scope = User.females.count
      expect(male_counts).to eq(male_counts_from_scope)
    end
  end
  

  # Indexing Verifying
  describe "indexing" do 
    it { should have_db_index(:id) }
    it { should have_db_index(:gender) }
    it { should have_db_index(:email) }
    it { should have_db_index(:created_at) }
  end

  # Associations Testing
  describe "associations" do
    it { should have_many(:user_teams) }
    it { should have_many(:teams).through(:user_teams) }
  end
end
 