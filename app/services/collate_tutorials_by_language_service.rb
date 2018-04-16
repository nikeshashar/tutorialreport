class CollateTutorialsByLanguageService
  def initialize(target_tutorial)
    @target_tutorial = target_tutorial
  end

  def call
    parse_tutorials
  end

  private

  def collated_tutorials
    Tutorial.where(language: @target_tutorial.language).where('id != ?', @target_tutorial.id).order(:id)
  end

  def parse_tutorials
    tutorials = collated_tutorials
    Hash["first", tutorials.first,
         "second", tutorials[1],
         "third", tutorials[2],
         "fourth", tutorials[3]]
  end
end
