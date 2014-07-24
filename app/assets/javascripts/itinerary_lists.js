
$(function(){
 // Adding a button that gets wired up after the page renders. On click it will add another search bar. 
  $("#btnAddOne").on("click", function() {
      if ($("searchbox").length >= 20)
        return;
    lastsearchbox = $("searchbox:last");
      var lastAvail = lastsearchbox[0].outerHTML;
      var offset = -1;
      // The offset moves along through the string until there aren't any more instances
      while((offset = lastAvail.indexOf("terms_attributes", offset + 1)) >= 0)
      {
        // Found a match, go forward until we find the numbers
        var numStart = 0;
        for(; offset < lastAvail.length; ++offset)
          if(lastAvail[offset] >= '0' && lastAvail[offset] <= '9')
          {
            numStart = offset;
            break;
          }
        // Now find the end of the numbers
        for(; offset < lastAvail.length; ++offset)
          if(lastAvail[offset] < '0' || lastAvail[offset] > '9')
          {
            // We've got a number -- let's change it out!
            theNumber = lastAvail.substring(numStart, offset);
            theNumber = parseInt(theNumber) + 1;
            lastAvail = lastAvail.substring(0,numStart) + theNumber +
             lastAvail.substring(offset,999999);
            break;
          }
      }
      lastsearchbox.after(lastAvail);
  });   
});

$(function(){
 // Adding a button that gets wired up after the page renders. On click it will add another search bar. 
  $("#removeTerm").on("click", function() {
    lastsearchbox = $("input.searchbox");
    if (lastsearchbox.length > 1)
      lastsearchbox.last().remove();
  });
});