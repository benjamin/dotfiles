class FolderCompletion
  def initialize(command, path)
    @command = command
    @path = path
  end
  
  def matches
    projects.select do |task|
      task[0, typed.length] == typed
    end
  end
  
  def typed
    @command[/\s(.+?)$/, 1] || ''
  end
  
  def projects
    `ls #{@path}`.split
  end
end