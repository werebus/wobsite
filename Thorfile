# frozen_string_literal: true

require 'pathname'
require 'thor/group'

module Middleman
  class Generator < ::Thor::Group
    include ::Thor::Actions

    source_root Pathname(__dir__).expand_path

    def copy_base_template
      directory 'template', '.'
    end

    def provide_setup_script
      run 'chmod a+x bin/setup'
    end

    def remove_bs_gemfile
      run 'rm -f BSGemfile'
    end

    def run_setup_script
      puts 'Running the setup script'
      run 'bin/setup'
    end

    def initialize_git_repository
      puts 'Creating Git repository'
      run 'git init'
    end
  end
end
