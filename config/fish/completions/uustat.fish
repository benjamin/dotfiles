# uustat: Deroffing man parser
# Autogenerated from man pages
complete -c uustat -s a -l all --description 'List all queued file transfer requests'
complete -c uustat -s e -l executions --description 'List queued execution requests rather than qu... [See Man Page]'
complete -c uustat -s s -l system --description 'List all jobs queued up for the named system'
complete -c uustat -s S -l not-system --description 'List all jobs queued for systems other than t... [See Man Page]'
complete -c uustat -s u -l user --description 'List all jobs queued up for the named user'
complete -c uustat -s U -l not-user --description 'List all jobs queued up for users other than ... [See Man Page]'
complete -c uustat -s c -l command --description 'List all jobs requesting the execution of the... [See Man Page]'
complete -c uustat -s C -l not-command --description 'List all jobs requesting execution of some co... [See Man Page]'
complete -c uustat -s o -l older-than --description 'List all queued jobs older than the given num... [See Man Page]'
complete -c uustat -s y -l younger-than --description 'List all queued jobs younger than the given n... [See Man Page]'
complete -c uustat -s k -l kill --description 'Kill the named job'
complete -c uustat -s r -l rejuvenate --description 'Rejuvenate the named job'
complete -c uustat -s q -l list --description 'Display the status of commands, executions an... [See Man Page]'
complete -c uustat -s m -l status --description 'Display the status of conversations for all r... [See Man Page]'
complete -c uustat -s p -l ps --description 'Display the status of all processes holding U... [See Man Page]'
complete -c uustat -s i -l prompt --description 'For each listed job, prompt whether to kill t... [See Man Page]'
complete -c uustat -s K -l kill-all --description 'Automatically kill each listed job'
complete -c uustat -s R -l rejuvenate-all --description 'Automatically rejuvenate each listed job'
complete -c uustat -s M -l mail --description 'For each listed job, send mail to the UUCP ad... [See Man Page]'
complete -c uustat -s N -l notify --description 'For each listed job, send mail to the user wh... [See Man Page]'
complete -c uustat -s W -l comment --description 'Specify a comment to be included in mail sent... [See Man Page]'
complete -c uustat -s B -l mail-lines --description 'When the  -M,  --mail,  -N, or  --notify opti... [See Man Page]'
complete -c uustat -s Q -l no-list --description 'Do not actually list the job, but only take a... [See Man Page]'
complete -c uustat -s x -l debug --description 'Turn on particular debugging types'
complete -c uustat -s I -l config --description 'Set configuration file to use'
complete -c uustat -s v -l version --description 'Report version information and exit'
complete -c uustat -l 'system.'
complete -c uustat -l 'user.'
complete -c uustat -l 'command.'
complete -c uustat -s j --description or
complete -c uustat -l jobid --description 'option to uucp (1) or uux (1)'
complete -c uustat -l 'kill-all.'
complete -c uustat -l help --description 'Print a help message and exit'

