# frozen_string_literal: true

require 'uri'
file_names = Dir['*.md']

file_names.each do |file_name|
  text = File.read(file_name)
  # new_contents = text.gsub(/```\n\n\n\!\[\]\(.+\)/, "```")
  new_contents = text

  regex = /^.+\/[\w:]+\.(jpe?g|png|gif)/i

  url_regex = /https?:\/\/[\S]+\)/

  results = text.scan(url_regex).map { |m| m.gsub!("g)","g")}
  results.each do |image_url|

    if image_url
      image_name = image_url.match( /[-_\w:]+\.(jpe?g|png|gif)$/i )
      puts image_url
      puts image_name
      puts "wget #{image_url} -O images/#{image_name}"
      system "wget #{image_url} -O images/#{image_name}"

      new_contents.gsub!(image_url, "images/#{image_name}")

    end
  end

#  new_contents = text.gsub(regex, '**\1** ')

  # new_contents = text.gsub(/。\*\* / , "。**")

#  new_contents = text.gsub(/\n<font/, "\n\n<font")


  # To merely print the contents of the file, use:
#  puts new_contents

  # To write changes to the file, use:
  File.open(file_name, 'w') { |file| file.puts new_contents }
end
