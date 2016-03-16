echo "Setting up git message format checker hook.."

echo "#!/usr/bin/env ruby
message_file = ARGV[0]
message = File.read(message_file)
if message.length > 200
	puts \"Your commit message should have less than 200 characters\"
	exit 1
end
\$regex = /<.+>\s\#.+\s.+/
if !\$regex.match(message)
  puts \"Your commit message is not formatted correctly \n Example: <Committer name> #123 Commit message\"
  exit 1
end" > .git/hooks/commit-msg

chmod ug+x .git/hooks/*

echo done