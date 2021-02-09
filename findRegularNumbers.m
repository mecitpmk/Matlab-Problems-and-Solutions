function myList = findRegularNumbers(x)

  MAX_RETURN_N = x;
  nested_list = createNestedList();
  cleaned_list = cleanUp(nested_list);
  final_list = sortthemUp(cleaned_list);
  myList = final_list(1,1:MAX_RETURN_N);
  
  
  function nested_list = createNestedList()
    nested_list = [];
    counter=1;
    for i = 0:MAX_RETURN_N
      for j =0:MAX_RETURN_N
        for k = 0:MAX_RETURN_N
          nested_list(counter) = 2^k*3^j*5^i;
          counter = counter + 1;
        end
      end
    end
  end


  function sorted_list = sortthemUp(nested_list)
    while true
      did_anything = false;
      for i=1:length(nested_list)-1
        if nested_list(i) > nested_list(i+1)
          did_anything = true;
          temp = nested_list(i);
          nested_list(i) = nested_list(i+1);
          nested_list(i+1) = temp;
        end
      end
      if ~did_anything
        break
      end
    end
    sorted_list = nested_list;
   end
   
   
  function new_list = cleanUp(nested_list)
    new_list = [];
    idx = 1;
    for i=1:length(nested_list)
      inside = false;
      value = nested_list(i);
      for k=1:length(new_list)
        if new_list(k) == value
          inside=true;
          break
        end
      end
      if inside
        continue
      else
        new_list(idx) = value;
        idx=idx+1;
      end
    end
    new_list;
  end


end