<?php

if (!isset($_SESSION['login'])) {
    echo "<form method='post'>";
    echo "Имя пользователя:<input type=text name='login'/><br>";
    echo "Пароль:<input type=password name='password'/><br>";
    echo "<input type='submit' value='Войти'/>";
    echo "</form>";
} else {
    echo "Привет, " . $_SESSION['name'] . ' ' . $_SESSION['surname'] . "<br>";
    echo "<a href='?logout=1'>Выйти из системы</a>";
}
?>