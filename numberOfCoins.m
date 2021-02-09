function coins = numberOfCoins(totalAmount, paidAmount)
  if (paidAmount-totalAmount >= 0.00)
    subs = paidAmount-totalAmount;
    coins = 0;

    while subs > 0
      if (subs >= 1.00)
        coins=coins+1;
        subs = subs - 1;
        
      elseif (subs >= 0.50)
        coins=coins+1;
        subs = subs - 0.50;
        
      elseif (subs >= 0.25)
        coins=coins+1;
        subs = subs - 0.25;
        
      elseif (subs >= 0.10)
        coins=coins+1;
        subs = subs-0.10;
        
      elseif (subs >= 0.05)
        coins=coins+1;
        subs = subs - 0.05;
        
      elseif (subs >= 0.01 || subs >= 0.009)
        coins=coins+1;
        subs = subs-0.01;
      else
          break
      end
      
    end
  else
    error("The customer paid less than the total amount of the transaction");

  end