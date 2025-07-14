<!DOCTYPE html>
   <html lang="en">
   <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <link rel="stylesheet" href="mapping.css">
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css" integrity="sha512-YWzhKL2whUzgiheMoBFwW8CKV4qpHQAEuvilg9FAn5VJUDwKZZxkJNuGM4XkWuk94WCrrwslk8yWNGmY1EduTA==" crossorigin="anonymous" referrerpolicy="no-referrer" /></head>
      <title>Landscape responsive card - Bedimcode</title>
   </head>
   <body>
   <header>
      <nav>
         <ul class='nav-bar'>
             <li class='logo'><a href='dashboard.jsp'><img src='logoNAV.jpg'/></a></li>
             <input type='checkbox' id='check' />
             <span class="menu">
                 <li><a href="dashboard.jsp">Home</a></li>
                 <li><a href="CFPgpt.jsp">CFP</a></li>
                 <li><a href="protocols.jsp">Protocols</a></li>
                 <li><a href="mapping.jsp">Scheduling</a></li>
                 <li><a href="adminlogin.jsp">Admin</a></li>
                 <li><a href="dashboard.jsp#footer">Contact</a></li>
                 <label for="check" class="close-menu"><i class="fas fa-times"></i></label>
             </span>
             <label for="check" class="open-menu"><i class="fas fa-bars"></i></label>
         </ul>
     </nav>
   </header>
      <div class="container">
         <div class="card__container">
            <article class="card__article">
               <img src="site1.jpg" alt="image" class="card__img">

               <div class="card__data">
                  <span class="card__description"></span>
                  <h2 class="card__title">E waste Scheduling</h2>
                  <a href="ewaste.jsp" class="card__button">Click Here</a>
               </div>
            </article>

            <article class="card__article">
               <img src="site2.jpg" alt="image" class="card__img">

               <div class="card__data">
                  <span class="card__description"></span>
                  <h2 class="card__title">Plastic Waste Scheduling</h2>
                  <a href="plastics.jsp"  target="blank" class="card__button">Click Here</a>
               </div>
            </article>

            <article class="card__article">
               <img src="site3.jpg" alt="image" class="card__img">

               <div class="card__data">
                  <span class="card__description"></span>
                  <h2 class="card__title">Food Waste Scheduling</h2>
                  <a href="foodwaste.jsp" class="card__button">Click Here</a>
               </div>
            </article>

         </div>
      </div>
   </body>
</html>