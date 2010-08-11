module SurveysHelper
  def link_to_remove_spoken
    non_haml do
      link_to "Remove Spoken Version", remove_spoken_path(@survey), :confirm => "Are you sure you want to remove this audio file?"
    end
  end
end
