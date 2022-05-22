<?php
require "dbconnect.php";
try {
    $sql = 'INSERT INTO event(title, start, end ) VALUES(:title, :start, :end)';
    $stmt = $conn->prepare($sql);
    $stmt->bindValue(':title', $_GET['title']);
    $stmt->bindValue(':start', $_GET['start']);
    $stmt->bindValue(':end', $_GET['end']);
    $stmt->execute();
    echo ("Категория успешно добавлена");
    // return generated id
    // $id = $pdo->lastInsertId('id');

} catch (PDOexception $error) {
    echo ("Ошибка добавления категории: " . $error->getMessage());
}
// перенаправление на главную страницу приложения
header('Location: http://609-91webprogramkd');
exit( );