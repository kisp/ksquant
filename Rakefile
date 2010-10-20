# -*- mode: ruby -*-

require 'rake/packagetask'

def ksquant_version
  File.open("ksquant.asd") do |file|
    m = /version +"([^"]+)"/.match(file.read)
    if m then
      m[1]
    else
      raise "Cannot determine version by looking at ksquant.asd"
    end
  end
end

Rake::PackageTask.new("ksquant", ksquant_version()) do |p|
  p.need_tar = true
  p.need_zip = true
  p.package_files.include("ksquant.asd")
  # lisp
  p.package_files.include("boxes.lisp")
  p.package_files.include("package.lisp")
  p.package_files.include("quantify-div.lisp")
  p.package_files.include("score2simple.lisp")
  p.package_files.include("simple2score.lisp")
  p.package_files.include("utils.lisp")
  # tutorial  
  p.package_files.include("tutorial/**/*.{pwgl,txt}")
end

task :default => ["package"]

task :tasks do |t|
  puts Rake.application.tasks
end
