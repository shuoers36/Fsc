$("#user-manage").click (function (e) {
      e.preventDefault();
      $.post("usermanage.do?type=query&page=1","json",function (nulist){
            $("body").html(nulist);
          }); 
    });
    