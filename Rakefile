require 'rake'

desc "Load app into ShotGun"
task :devel do
	system "shotgun config.ru"
end

desc "Load app into Rack"
task :deploy do
	system "rackup -p 9292 config.ru &"
end

task :default => [:devel]

