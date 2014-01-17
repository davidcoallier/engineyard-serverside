require 'spec_helper'

describe "Deploying an application that uses Python and pip" do
  with_pip_mocked do |mocked|
    before(:all) do
      mock_pip if mocked
    end

    context "pip in detect mode" do
      before do
        deploy_test_application('python')
      end

      it "runs 'pip install -r requirements.txt'" do
        install_cmd = @deployer.commands.grep(/pip install -r requirements.txt/).first
        install_cmd.should_not be_nil
      end
    end

    context "pip disabled" do
      before do
        deploy_test_application('pip_disabled')
      end

      it "does not run 'pip install -r requirements.txt'" do
        @deployer.commands.grep(/pip/).should be_empty
      end
    end
  end
end
