module MCollective
  module Agent
    class Users<RPC::Agent

      activate_when do
        File.executable?("/usr/bin/w")
      end


      action "who" do
        reply.fail! "Cannot find /usr/bin/w" unless File.exist?("/usr/bin/w")
        reply[:exitcode] = run("/usr/bin/w -uh", :stdout => :output, :chomp => true)
        reply.fail! "who failed, exit code was #{reply[:exitcode]}" unless reply[:exitcode] == 0
      end

      action "last" do
        reply.fail! "Cannot find /usr/bin/last" unless File.exist?("/usr/bin/last")
        reply[:exitcode] = run("/usr/bin/last -n 50", :stdout => :output, :chomp => true)
        reply.fail! "last failed, exit code was #{reply[:exitcode]}" unless reply[:exitcode] == 0
      end

    end
  end
end

# vi:tabstop=2:expandtab:ai:filetype=ruby
