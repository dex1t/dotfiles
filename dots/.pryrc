## Settings
Pry.config.color = true
Pry.editor = 'vim'

## Alias
Pry.config.commands.alias_command "lM", "ls -M"
Pry.config.commands.alias_command 'w', 'whereami'
Pry.config.commands.alias_command '.clr', '.clear'

if defined?(PryDebugger)
  Pry.commands.alias_command 'c', 'continue'
  Pry.commands.alias_command 's', 'step'
  Pry.commands.alias_command 'n', 'next'
  Pry.commands.alias_command 'f', 'finish'
end
