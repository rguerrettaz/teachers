# Load the rails application
require File.expand_path('../application', __FILE__)

require 'oembed'
require 'instagram'
require 'levenshtein'

# Initialize the rails application
TeacherGap::Application.initialize!
