# module Concerns
#   module Findable
#
#     module ClassMethods
#
#       def find_by_name(name)
#         self.all.find {|a| a.name == name }
#       end
#
#       def create (name)
#         new_a=self.new(name)
#         new_a.save
#         new_a
#       end
#
#       def find_or_create_by_name (name)
#         nameditem = self.find_by_name(name)
#         if nameditem == nil
#           nameditem = self.create(name)
#         end
#         nameditem
#       end
#     end
#
#     module InstanceMethods
#       def save
#         @@all << self
#       end
#     end
#   end
#
# end
