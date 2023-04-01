RSpec.describe "Users::Generics", type: :routing do
describe "GET routes rxistance rhecking" do
    it { should route(:get, '/').to(controller: "dashboards", action: :index) }
  end
end
