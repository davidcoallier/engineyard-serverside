require 'engineyard-serverside/dependency_manager/base'

module EY
  module Serverside
    class DependencyManager
      class Pip < Base
        def detected?
          paths.requirements_txt.exist?
        end

        def install
          shell.status "Activating Virtual Environment (/data/virtualenvs/#{@app_name}), installing pip packages (requirements.txt detected), and deactivating virtual environment"
          run "cd #{paths.active_release} && /data/virtualenvs/#{@app_name}/bin/activate && pip install -r requirements.txt && deactivate"
        end
      end
    end
  end
end
