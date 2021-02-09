function [optimalPasswords, duration] = continuousInterval(doorPasswords)
  
  
  add_list = getAddList(doorPasswords);
  [start,stop] = stStop(add_list);
  x = doorPasswords(start:stop);
  cleaned_list = cleanList(x);
  optimalPasswords = sortOptValues(cleaned_list);
  duration = length(x);
  
  
  
  function add_list = getAddList(doorPasswords)
    add_list = [];
    count = 1;
    for i=1:length(doorPasswords)-2 
      if (doorPasswords(i) == doorPasswords(i+1))
        add_list(count) = i;
        add_list(count+1) = i+1;
        count=count+2;
      end
      if (doorPasswords(i) == doorPasswords(i+2))
        add_list(count) = i;
        add_list(count+1)  = i+2;
        count=count+2;
      end
    end
  end
  

  
  function [startVal,stopVal] = stStop(add_list)
    list_ct = 1;
    start = 0;
    stop = 0;
    if length(add_list) > 4
      new_list =[];
      for i=1:2:length(add_list)-2
        if add_list(i) == add_list(i+2)-1
          new_list(list_ct) = add_list(i);
          new_list(list_ct+1) = add_list(i+3);
          list_ct=list_ct+2;
         end
      end
      start = new_list(1);
      stop = new_list(length(new_list));
      startVal = start;
      stopVal = stop;
      new_list;
    else
      start = add_list(1);
      stop = add_list(length(add_list));
      startVal = start;
      stopVal = stop;
    end
  end

  function cleaned_list = cleanList(x)
    ct = 1;
    cleaner_list = [];
    for k = 1:length(x)
      check_inside = false;
      for c =1:length(cleaner_list)
        if cleaner_list(c) == x(k)
          check_inside = true;
          break;
        end
      end
      if check_inside
        continue
      else
        cleaner_list(ct) = x(k);
        ct=ct+1;
      end
    end
    cleaned_list = cleaner_list;
  end
  
  function sortOptimal = sortOptValues(cleaner_list)
    while true;
      changed_index = false;
      for i=1:length(cleaner_list)-1
        if (cleaner_list(i) > cleaner_list(i+1))
          temp = cleaner_list(i);
          cleaner_list(i) = cleaner_list(i+1);
          cleaner_list(i+1) = temp;
          changed_index = true;
         end
      end
      if ~changed_index
        break
      end
    end
    sortOptimal = cleaner_list;
  end
  
end