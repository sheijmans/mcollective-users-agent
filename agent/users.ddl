metadata    :name        => "users",
            :description => "MCollective Agent to display users on systems",
            :author      => "S. Heijmans",
            :license     => "ASL2",
            :version     => "0.0.1",
            :url         => "https://github.com/sheijmans/mcollective-users-agent",
            :timeout     => 5

action "who", :description => "Display logged on users" do
    display :always

    output :output,
           :description => "Output from w command",
           :display_as  => "Output"

    output :exitcode,
           :description => "The exitcode from the w command",
           :display_as => "Exit Code"

    if respond_to?(:summarize)
        summarize do
            aggregate summary("output")
        end
    end
end

action "last", :description => "Display last logged on users" do
    display :always

    output :output,
           :description => "Output from last command",
           :display_as  => "Output"

    output :exitcode,
           :description => "The exitcode from the last command",
           :display_as => "Exit Code"

    if respond_to?(:summarize)
        summarize do
            aggregate summary("output")
        end
    end
end
