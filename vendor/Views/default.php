<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/style.css">
    <script src="/js/form.js" defer></script>
    <script src="/js/phoneBook.js" defer></script>
    <script src="/js/myContacts.js" defer></script>
</head>
    <body>
        <header>
            <h1 class="text-center mt-5"><a href="/" style="text-decoration: none; color: #bb4f5f">PhoneBook</a></h1>
        </header>
        <nav>
            <ul class="nav">
                <?php if (\Facade\Auth::User()):?>
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="<?= Route::url('auth', 'logout')?>">Logout</a>
                </li>
                    <li class="nav-item">
                        <a class="nav-link mcontact" href="#">My Contact</a>
                    </li>
                <?php else:?>
                <li class="nav-item">
                    <a class="nav-link active login" aria-current="page" href="#">Login</a>
                </li>
                <?php endif;?>
                <li class="nav-item pbook">
                    <a class="nav-link pbook" href="#">Public Phonebook</a>
                </li>
            </ul>
        </nav>
        <main class="content">
            <?php include_once 'vendor'.DIRECTORY_SEPARATOR.self::VIEWS_DIR.DIRECTORY_SEPARATOR. $pageTemplate. '.php'?>
        </main>
    </body>
</html>
