module Concerns::Findable
  
      def find_by_name(name)
        self.all.detect {|x| x.name == name}
        
      end 
  ## iterate through all array and return first value where condition is true
  
  
      def find_or_create_by_name(name)
      find_by_name(name) ? find_by_name(name) : create(name)
      end
      
      
end
