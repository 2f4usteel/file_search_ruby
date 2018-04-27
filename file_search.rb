require './shell_command.rb'

module FileSearch
  module_function
  
  #find the file in current directory
  def find file_name
    begin 
      start_time = Time.now.to_f
      all_file = "\'" + "#{file_name}" + ".*" + "\'" 
      command = %Q[find $PWD -type f -name #{all_file}]
      # command = %Q[find ./ -xdev -name  #{all_file}] 
      result = ShellCommand.run command
      result_array = result.split("\n")
      if result_array.any?
        i = 1
        result_array.each do |path|
          puts "#{i}." + " #{path}"
          time_taken = Time.now.to_f - start_time 
          puts "Time Taken: #{time_taken} seconds"
          i = i + 1
        end
        return
      else 
        #Throw run time error if the file is not found
        raise "No such file: #{file_name} found"
      end
    rescue Exception => error
      raise "#{error.message}"
    end  
  end

  def find_in_entire_system
    puts "finding the file in the entire system"
  end

end