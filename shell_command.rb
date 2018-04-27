module ShellCommand
  module_function

  # Run a shell command i.e O.S based command
  def self.run cmd
    begin
      result = %x[ #{cmd} ]
      result.chomp
    rescue Exception => error
      #Throw run time error if the command not executed
      raise "The command:\'#{cmd}\' was not executed cause - #{error.message}"
    end
  end
  
end