<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Zen+Old+Mincho:wght@400;900&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Lato&family=Zen+Old+Mincho:wght@400;900&display=swap" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600;800&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="/css/style.css">
    <title>Home</title>
</head>
<body>
    <header class="header">
        <div class="overlay has-fade"></div>
        <nav class="webContainer flex flex-jc-sb flex-ai-c flex-fg-c">
            <a href="https://github.com/InderbirSGill/CMPE-131-Group-WeTried" target="_blank" class="header__github">
                <img src="static/Images/wt.png" width="30" height="30" alt="WeTried" srcset="">
            </a>
            <a id="buttonNav" href="#" class="header__toggle hide-desktop">
                <span> </span><span></span><span></span>
            </a>
            <div class="header__links hide-mobile">
                <a href="homepage" class="active">Home</a>
                <a href="about">About</a>
            </div>
            <a href="login" class="button header__cta hide-mobile">Login</a>
        </nav>
        <div class="header__menu webContainer has-fade">
            <a href="homepage">Home</a>
            <a href="about">About</a>
            <a href="login">Login</a>
        </div>
    </header>

    <section class="intro webContainer">
        <div class="intro__image"></div>
        <div class="intro__text">
            <h1>We-Tried to Make a Project Calendar</h1>
            <p>Featuring a bootstrap calendar as our interface, team leaders will be able to quickly assign works to their respective teams. Communications have never been easier with the ability to create events on the fly using the lightweight program.</p>
            <a href="signup" id="homepageSU" class="button intro__cta">SIGN UP</a>
        </div>
    </section>

    <section class="descriptions">
        <div class="temp webContainer">
            <div id="weTriedPictures" class="carousel slide" data-ride="carousel" style="padding-bottom:20px">
                <!-- Carousel content here -->
            </div>
            <div class="descriptions__grid">
                <!-- Descriptions grid content here -->
            </div>
        </div>
    </section>

    <!-- The dots/circles -->
    <div style="text-align:center">
        <span class="dot" onclick="currentSlide(1)"></span>
        <span class="dot" onclick="currentSlide(2)"></span>
        <span class="dot" onclick="currentSlide(3)"></span>
    </div>

    <script type="text/javascript" src="path/to/your/js/script.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>