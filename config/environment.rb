require 'bundler'
Bundler.require

module Concerns
  module ClassMethods
    def destroy_all
      self.all.clear
    end

  end

  module InstanceMethods
    def initialize(name)
      @name = name
    end

    def save
      self.class.all << self
    end

  end

end

require_all 'lib'
