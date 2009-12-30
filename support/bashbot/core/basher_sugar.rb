module BasherSugar
  def def_field(*names)
    class_eval do 
      names.each do |name|
        define_method(name) { |*args| 
          args.size == 0 ? instance_variable_get("@#{name}") : instance_variable_set("@#{name}", *args)
        }
      end
    end
  end
end
