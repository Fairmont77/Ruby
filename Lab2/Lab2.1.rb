# frozen_string_literal: true

dots = [[62,300],[105,303],[159,304],[217,303],[257,302],
        [320,292],[373,280],[421,234],[439,187],[449,144],
        [430,107],[403,78],[354,65],[298,54],[208,49],
        [169,42],[113,45],[79,67],[66,123],[59,156],
        [65,198],[104,202],[147,220],[153,242],[131,249],
        [87,256],[71,267]]

$sum = 0

for i in 0..dots.size-1 do
  if i == dots.size-1
    $sum += (dots[i][0] + dots[0][0]) * (dots[0][1] - dots[i][1])
  else
    $sum += (dots[i][0]+dots[i+1][0])*(dots[i+1][1]-dots[i][1])
  end
end

$sum = $sum.abs/2
print "result = " + $sum.to_s, "\n"