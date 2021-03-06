<?php

define ( "DEBUG" , TRUE ) ;
define ( "PATH" , "/ShopProject" ) ;


session_start () ;
require __DIR__ . '/../vendor/autoload.php' ;
require __DIR__ . '/functions.php' ;


spl_autoload_register ( function($cn) {
    $file = __DIR__ . "/$cn.class.php" ;
    if ( file_exists ( $file ) ) {
        require $file ;
    }
} ) ;

$loader = new Twig_Loader_Filesystem ( __DIR__ . '/../templates' ) ;

$twig = new Twig_Environment ( $loader , array (
    'cache' => __DIR__ . '/../cache/compilation_cache' , 'debug' => DEBUG ) ) ;

$twig -> addGlobal ( "path" , PATH ) ;
$twig -> addGlobal ( "messages" , get_flash_message () ) ;
$twig -> addGlobal ("cart" , new Cart () ) ;

$login = new Login();
if ($login->  is_login()) {
    $twig->addGlobal("user", $_SESSION['userId']);
}
