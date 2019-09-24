require 'shrine'
require 'shrine/storage/file_system'

Shrine.storages = {
  cache: Shrine::Storage::FileSystem.new('public', prefix: 'uploads/cache'),
  store: Shrine::Storage::FileSystem.new('public', prefix: 'uploads/store')
}

Shrine.plugin :activerecord
Shrine.plugin :pretty_location
Shrine.plugin :parsed_json
Shrine.plugin :determine_mime_type
Shrine.plugin :logging, logger: Rails.logger
