module Config 

  #Search command based on O.S - Replace the commands if necessary 
  SEARCH_COMMAND = {
    :unix_based_systems => 'find $PWD -type f -name', 
    :window_based_system => 'windows based system',
    :osx_based_system => 'osx based system',
    :mac_based_system => 'mac based system'
  }

  #Function to check if O.S is windows
  def self.windows?
    (/cygwin|mswin|mingw|bccwin|wince|emx/ =~ RUBY_PLATFORM) != nil
  end

  #Function to check if O.S is mac
  def self.mac?
    (/darwin/ =~ RUBY_PLATFORM) != nil
  end

  #Function to check if O.S is unix based
  def self.unix?
    !self.windows?
  end

  #Function to check if O.S is linux
  def self.linux?
    self.unix? and not self.mac?
  end

  #Function to find O.S Specific search command
  def self.find_os_based_command
    if self.windows?
      return SEARCH_COMMAND[:window_based_system]
    elsif self.mac?
      return SEARCH_COMMAND[:osx_based_system]
    elsif self.unix?
      return SEARCH_COMMAND[:unix_based_systems]
    elsif self.linux?
      return SEARCH_COMMAND[:unix_based_systems]
    else
      return nil
    end
  end

end