function logout(){
  $.ajax({
        headers: {"Auth" : Cookies.get("Auth")},
        type: "POST",
        url: "/enterprise/logout",
        success: function(data){
          console.log("logged out");
          Cookies.remove("Auth");
          window.location.replace("/login");
        }   
  }); 
}
