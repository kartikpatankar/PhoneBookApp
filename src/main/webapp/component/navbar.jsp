<%@page import="com.entity.User" %>
<nav class="navbar navbar-expand-lg bg-primary">
  <div class="container-fluid">
    <a class="navbar-brand" href="index.jsp"><i class="fa-solid fa-phone"></i> PhoneBook</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="index.jsp"><i class="fa-solid fa-house"></i> Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" href="addContact.jsp"><i class="fa-solid fa-user-plus"></i> Add Phone No</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" href="viewContact.jsp"><i class="fa-solid fa-eye"></i> View Contact</a>
        </li>
      </ul>
      <%
      	User user=(User)session.getAttribute("user"); 
        String fname="";
      	if(user==null){
      %>
       <form class="form-inline my-2 my-lg-0">
        <a href="login.jsp" class="btn btn-success"><i class="fa-solid fa-user"></i> Login</a>
        <a href="register.jsp" class="btn btn-danger ml-2"><i class="fa-regular fa-user"></i> Register</a>
      </form>
      <% 
      	} else{
      		
      %>
      <form class="form-inline my-2 my-lg-0">
        <button class="btn btn-success"><%=user.getName()%></button>
        <a data-toggle="modal" data-target="#exampleModalCenter" class="btn btn-danger ml-2 text-white">Logout</a>
      </form>
      <%
      	String words[]=user.getName().split(" ");
        fname=words[0];
      	}
      %>
    </div>
    <!-- Logout Pop up starts here -->

<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle"><%=fname%></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body text-center">
      <h6>Are you sure you want to log out?</h6>
        <button type="button" class="btn btn-primary" data-dismiss="modal">Cancel</button>
        <a href="logout" class="btn btn-warning">Yes, Logout</a>
      </div>
      <div class="modal-footer">
        
      </div>
    </div>
  </div>
</div>
    <!-- Logout Pop up ends here -->
  </div>
</nav>