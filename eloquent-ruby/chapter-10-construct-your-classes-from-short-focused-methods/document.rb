class Document
  # Most of class omitted

  def prose_rating
    return :really_pretentious if really_pretentious?
    return :somewhat_pretentious if somewhat_pretentious?
    return :really_informal if really_informal?
    return :somewhat_informal if somewhat_informal?
    return :about_right
  end

  def really_pretentious?
    pretentious_density > 0.3 && informal_density < 0.2
  end
  
  def somewhat_pretentious?
    pretentious_density > 0.3 && informal_density >= 0.2
  end

  def really_informal?
    pretentious_density < 0.1 && informal_density > 0.3
  end

  def somewhat_informal?
    pretentious_density < 0.1 &&  informal_density <= 0.3
  end

  def pretentious_density
    # Somehow compute density of pretentious words
  end
  
  def informal_density
    # Somehow compute density of informal words
  end
