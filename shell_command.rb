module ShellCommand
  module_function

  #Function to run a shell command i.e O.S based command - Wrapper in ruby
  def self.run cmd
    begin
      #Ruby method to run a system command
      result = %x[ #{cmd} ]

      #removing trailing new lines and returning
      result.chomp
    rescue Exception => error
      #Throw run time error if the command is not executed
      raise "The command:\'#{cmd}\' was not executed cause - #{error.message}"
    end
  end
  
end