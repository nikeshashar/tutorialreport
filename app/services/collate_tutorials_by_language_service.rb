class CollateTutorialsByLanguageService
  def initialize(target_tutorial)
    @target_tutorial = target_tutorial
  end

  def call
    delete_nil
  end

  private
  
  def delete_nil
    parse_tutorials.delete_if { |k,v| v.nil? }
  end

  def parse_tutorials
    Hash["first", collated_tutorials.first,
         "second", collated_tutorials[1],
         "third", collated_tutorials[2],
         "fourth", collated_tutorials[3]]
  end

  def collated_tutorials
    Tutorial.where(language: @target_tutorial.language).where('id != ?', @target_tutorial.id).order(:id)
  end
end
