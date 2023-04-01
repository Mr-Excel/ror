RSpec.describe "Users::Generics", type: :routing do
  describe "GET routes rxistance rhecking" do
    it { should route(:get, '/users').to(controller: "users/generic", action: :index) }
  end
end
