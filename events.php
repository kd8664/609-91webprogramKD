<h1>Категории задач:</h1>
<table border='1'>
    <?php
    $result = $conn->query("SELECT * FROM event");
    while ($row = $result->fetch()) {
        echo '<tr>';
        echo '<td>' . $row['id'] . '</td><td>' . $row['title'] . '</td><td>' . $row['start'] . '</td><td>' . $row['end'] . '</td>';
        echo '<td><a href=deleteevent.php?id='.$row['id'].'>Удалить</a></td>';
        echo '</tr>';
    }
    ?>
</table>
<h2>Создание категории</h2>
<form method="get" action="insert.php">
    <input type="text" name="title">
    <input type="date" name="start">
    <input type="date" name="end">
    <input type="submit" value="Создать">
</form>