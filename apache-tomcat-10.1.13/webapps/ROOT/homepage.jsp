<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <!-- <link rel="stylesheet" type="text/css" href="/css/homepage.css"> -->
    <style>
      body {
        background-image: url('background.png');
        background-size: cover;
        background-repeat: no-repeat;
        background-position: center;
        color: white;
        font-family: 'Arial', sans-serif;
        margin: 0;
        padding: 0;
        display: flex;
        align-items: center;
        justify-content: center;
        height: 100vh;
        background-color: black;
      }

      .content {
        text-align: center;
      }

      h1 {
        color: #66c0f4;
        text-shadow: 2px 3px 3px rgb(113, 113, 114)/* Adjust the shadow values as needed */

      }

      p {
        color: #c0c0c0;
      }

      button {
        background-color: #66c0f4;
        color: #171a21;
        padding: 10px 20px;
        font-size: 20px;
        cursor: pointer;
        border: none;
        border-radius: 5px;
        margin: 10px;
        text-decoration: none;
      }

      button:hover {
        background-color: #4587b2;
      }

      a {
        text-decoration: none;
        color: #66c0f4;
      }

      a:hover {
        color: #4587b2;
      }
      .overlay {
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background: rgba(0, 0, 0, 0.9); /* Adjust the transparency by changing the last parameter */
        display: show; /* Initially hide the overlay */
        z-index: -1;
      }
      p{
        color:white;
      }
    </style>
    <title>Game Picker Database</title>
  </head>
  <body>
    <div class="overlay"></div>
    <div class="content">
      <img src="logo3.png" alt="Insert Picture Here">

      <h1>Welcome to Game Picker Database</h1>
      <h3>
        Uncover the Power-Ups: From Epic Discounts to Game Revelations!      
      </h3>
      <a href="login.jsp"><button>Login</button></a>
      <a href="signup.jsp"><button>Signup</button></a>
      
    </div>
  </body>
</html>