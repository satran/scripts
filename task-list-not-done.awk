{$2="";todos[$1]=$0}

/@done/ {
  match ($0, /@done\([0-9]*\)/);
  # Get the id from @done(ID)
  # start 6 characters after for @done(
  # end 7 characters before for ) and @done(
  id=substr($0,RSTART+6, RLENGTH-7); 
  delete todos[id]; # remove the done task 
  delete todos[$1]; # remove the done event 
}

END { for (key in todos) {print todos[key]} }
