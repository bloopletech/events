class Event < ActiveRecord::Base
  acts_as_taggable

  default_scope :order => 'started_at DESC, finished_at ASC'
end
