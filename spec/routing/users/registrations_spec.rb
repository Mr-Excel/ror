RSpec.describe "Users::Generics", type: :routing do
  describe "GET routes rxistance rhecking" do
    it { should route(:get, '/users/sign_up').to(controller: "users/registrations", action: :new) }
    it { should route(:get, '/users/edit').to(controller: "users/registrations", action: :edit) }
  end
  describe "POST routes rxistance rhecking" do
    it { should route(:post, '/users').to(controller: "users/registrations", action: :create) }
    it { should route(:put, '/users').to(controller: "users/registrations", action: :update) }
  end
end
