module Gemsmith
  module Skeletons
    # Configures RSpec support.
    class RspecSkeleton < BaseSkeleton
      def enabled?
        cli.template_options.key?(:rspec) && cli.template_options[:rspec]
      end

      def create
        return unless enabled?

        cli.template "%gem_name%/lib/%gem_name%/tasks/rspec.rake.tt", cli.template_options
        cli.template "#{rspec_root}/spec_helper.rb.tt", cli.template_options
        cli.template "#{rspec_root}/lib/%gem_name%/%gem_name%_spec.rb.tt", cli.template_options
        cli.template "#{rspec_root}/support/kit/default_config.rb.tt", cli.template_options
        cli.template "#{rspec_root}/support/kit/stderr.rb.tt", cli.template_options
        cli.template "#{rspec_root}/support/kit/stdout.rb.tt", cli.template_options
        cli.template "#{rspec_root}/support/kit/temp_dir.rb.tt", cli.template_options
      end

      private

      def rspec_root
        "%gem_name%/spec"
      end
    end
  end
end
