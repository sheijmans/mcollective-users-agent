class MCollective::Application::Users<MCollective::Application
   description "Display users on remote nodes"

    usage <<-END_OF_USAGE
mco users [OPTIONS] [FILTERS] <ACTION> <file>

The ACTION can be one of the following:

    who  -  display users currently logged on
    last -  display last logged on users
    END_OF_USAGE

    def post_option_parser(configuration)
      if ARGV.size < 1
        raise "Please specify action"
      else
        action  = ARGV.shift
        file  = ARGV.shift

        unless action.match(/^(who|last)$/)
          raise "Action can only be who or last."
        end

        configuration[:action]  = action
###        configuration[:file]  = file
      end
    end

    def validate_configuration(configuration)
      if MCollective::Util.empty_filter?(options[:filter]) and
      options[:discovery_options].empty?
        print "Do you really want to operate on " +
          "locate unfiltered? (y/n): "

        STDOUT.flush

        # Only match letter "y" or complete word "yes" ...
        exit! unless STDIN.gets.strip.match(/^(?:y|yes)$/i)
      end
    end

    def main
      action  = configuration[:action]
###      file  = configuration[:file]

      mc = rpcclient("users", {:options => options})

      #printrpc mc.version(:options => options)
###      mc.send(action, { :file => file }).each do |node|
      mc.send(action).each do |node|

        sender = node[:sender]
        data = node[:data]

        found = data[:output]
        if found != '' and data[:exitcode] == 0
          printf("%-40s:\n", sender)
          if action == 'who'
            printf("USER     TTY      FROM              LOGIN@   IDLE   JCPU   PCPU WHAT\n")
          end
          printf("%-80s\n\n", found)
        end

      end

      mc.disconnect

      puts
      printrpcstats :summarize => true

    end
end
