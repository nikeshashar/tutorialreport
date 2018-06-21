require 'yaml'

namespace :upload_tutorials do
  desc 'Upload the new tutorials from the tutorials.yml file'
  task add_new_tutorials: :environment do
    path = File.join(Rails.root, 'data/tutorials.yml')

    if File.exist?(path)
      data = YAML.safe_load(File.open(path))
      add_tutorials(data)
    else
      puts 'File can not be found'
    end
  end

  private

  def add_tutorials(data)
    data.each do |tutorial|
      if Tutorial.exists?(description: tutorial['description'])
        puts 'Tutorial already exists'
      else
        Tutorial.create(title: tutorial['title'],
                        description: tutorial['description'],
                        link: tutorial['link'],
                        rating: tutorial['rating'],
                        suitability: tutorial['suitability'],
                        type_of_tutorial: tutorial['type_of_tutorial'],
                        language: tutorial['language'],
                        avatar_url: tutorial['avatar_url'],
                        free?: tutorial['free?'])

        puts 'Tutorial added'
      end
    end
  end
end
