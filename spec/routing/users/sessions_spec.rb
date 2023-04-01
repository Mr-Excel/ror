RSpec.describe "Users::Generics", type: :routing do
  describe "GET routes rxistance rhecking" do
    it { should route(:get, '/users/sign_in').to(controller: "users/sessions", action: :new) }
  end
  describe "POST routes rxistance rhecking" do
    it { should route(:post, '/users/sign_in').to(controller: "users/sessions", action: :create) }
  end
  describe "DELETE routes rxistance rhecking" do
    it { should route(:delete, '/users/sign_out').to(controller: "users/sessions", action: :destroy) }
  end
end
