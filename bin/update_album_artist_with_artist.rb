#!/bin/env ruby

require 'id3lib'

abort "Usage: update_album_artist_with_artist.rb MP3..." unless ARGV.length > 0

ARGV.each do |path|
  abort "#{path} is not writable" unless File.writable?(path)

  tag = ID3Lib::Tag.new(path)
  tag.set_frame_text(:TPE2, tag.artist)
  tag.update!
end
