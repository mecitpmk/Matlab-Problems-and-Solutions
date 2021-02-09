function myList = rightTriangleEdges(listOfIntegers)
  squared_list = listOfIntegers.^2 ;
  myList = [];
  for i = 1:length(squared_list)
    for j = i+1:length(squared_list)
      summation = squared_list(i)+squared_list(j);
      for y = 1:length(squared_list)
        if summation == squared_list(y)
          myList = [listOfIntegers(i),listOfIntegers(j),listOfIntegers(y)];
        end
      end
    end
  end
end