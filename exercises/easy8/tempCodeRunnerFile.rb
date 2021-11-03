def center_of(string)
  idx = string.size / 2
  if string.size.odd?
    string[idx]
  else
    string[idx - 1, 2]
  end
end