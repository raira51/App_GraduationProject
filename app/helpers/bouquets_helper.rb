module BouquetsHelper
  # flower card images (flowers/index 用)
  def flower_images_map
    @flower_images_map ||= YAML
      .load_file(Rails.root.join("config/flower_images.yml"))
      .transform_keys(&:to_s)
  rescue StandardError
    {}
  end

  def flower_image_path_for(flower)
    map = flower_images_map
    map[flower.id.to_s] || map["default"] || "flowers/default.png"
  end

  # bouquet images (celebrations/edit 用) 
  def bouquet_images_map
    @bouquet_images_map ||= YAML
      .load_file(Rails.root.join("config/bouquet_images.yml"))
      .transform_keys(&:to_s)
  rescue StandardError
    {}
  end

  def bouquet_image_path_for(celebration)
    map = bouquet_images_map
    name = celebration.bouquet&.bouquet_flowers&.first&.flower&.name.to_s.strip
    map[name] || map["default"] || "bouquets/default.png"
  end

  def bouquet_main_flower_name_for(celebration)
    celebration.bouquet&.bouquet_flowers&.first&.flower&.name
  end

  def background_images_map
    @background_images_map ||= YAML
      .load_file(Rails.root.join("config/background_images.yml"))
      .transform_keys(&:to_s)
  rescue StandardError
    {}
  end

  def background_image_path_for(celebration)
    map = background_images_map

    # bouquet内の「主役の花」を決める（今は先頭の花でOK）
    flower_id = celebration.bouquet&.bouquet_flowers&.first&.flower_id

    map[flower_id.to_s] || map["default"] || "backgrounds/orange_rose_celebration.png"
  end
end
