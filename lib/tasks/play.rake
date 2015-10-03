desc 'Create play.yml file'

task :play_config do
  path = File.join(Rails.root, "config", "google_play.yml")

  if File.file? path
    puts "You already have google_play.yml file"
    next
  else
    copy_file("#{Gem.loaded_specs["play_purchase_verifycation"].full_gem_path}/config/google_play.yml","config/play.yml")
  end
end