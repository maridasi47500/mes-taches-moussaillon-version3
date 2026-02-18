{:frimages => 
  { :i18n => 
    { :plural => 
      { :keys => [:one, :few, :any, :other],
        :rule => lambda { |n| 
          if n == 1
            :one
          else
            if n == 2

              :few
            elsif n == 3
              :any 
            else
              :other 
            end
          end
        } 
      } 
    } 
  } 
}


