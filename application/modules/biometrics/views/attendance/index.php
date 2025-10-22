<h2>Attendance Logs</h2>
<table border="1">
<tr><th>ID</th><th>Name</th><th>Type</th><th>Time</th></tr>
<?php foreach($logs as $l): ?>
<tr>
  <td><?= $l->id ?></td>
  <td><?= $l->name ?></td>
  <td><?= $l->event_type ?></td>
  <td><?= $l->event_time ?></td>
</tr>
<?php endforeach; ?>
</table>
