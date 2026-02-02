module CelebrationsHelper
  def letter_icon_path_for(celebration)
    if celebration.letters.any?
      "letters/flower_letter.png"
    else
      "letters/default.png"
    end
  end
end
