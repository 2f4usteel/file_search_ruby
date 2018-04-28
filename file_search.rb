require './shell_command.rb'
require './config.rb'

module FileSearch
  module_function

  #Function to get file file pattern matching
  def self.find_file_pattern file_name
    if Config.windows?
      return "#{file_name}*"
    elsif Config.mac?
      return "\'#{file_name}*\'" 
    elsif Config.unix?
      return "\'#{file_name}*\'" 
    elsif Config.linux?
      return "\'#{file_name}*\'" 
    else
      return "\'#{file_name}*\'" 
    end
  end
  
  #Function to find the time and display the output in the specified format
  def self.find file_name
    begin 
      #Get the current time in seconds
      start_time = Time.now.to_f

      #Throwing run time error if the O.S based search command was not found
      raise "OS Type could not be found" if Config.find_os_based_command.nil?
      
      #Getting the file pattern based on O.S
      file_pattern = self.find_file_pattern file_name
      
      command = %Q[#{Config.find_os_based_command} #{file_pattern}]
      
      result = ShellCommand.run command
      result_array = result.split("\n")

      #checking the result is present and formatting 
      if !result_array.empty?
        result_array.each_with_index{ |path, index|
          puts "#{index+1}." + " #{path}"
          time_taken = Time.now.to_f - start_time 
          puts "Time Taken: #{time_taken} seconds"
        }
        #Returning nothing to avoid printing of result_array again
        return
      else 
        puts "No such file: \'#{file_name}\' found"
      end

    rescue Exception => error
      raise "#{error.message}"
    end  
  end

end