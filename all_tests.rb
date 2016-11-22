Dir.glob("test/*_test.rb").each do |file|
  require_relative file
end
