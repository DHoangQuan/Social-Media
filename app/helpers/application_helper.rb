module ApplicationHelper
  def file_type(filename)
    types = {
      :jpeg => "image",
      :jpg => "image",
      :gif => "image",
      :png => "image",
      :mp4 => "video",
      :mp3 => "video", 
      :mkv => "video"
    }
    types[filename.split(".").last.to_sym]
  end
end
