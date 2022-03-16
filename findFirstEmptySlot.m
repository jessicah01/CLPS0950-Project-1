function slot = findFirstEmptySlot(boardState, columnNum)
  slot = -1;
  for ii = 6:-1:1
      if ~boardState(ii, columnNum)
          slot = ii;
          break
      end
  end
end