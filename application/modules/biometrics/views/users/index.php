<h2>Employees</h2>
<a href="<?php echo site_url('users/create'); ?>">Add Employee</a>
<table border="1">
<tr><th>ID</th><th>Employee No</th><th>Name</th></tr>
<?php foreach($users as $u): ?>
<tr>
  <td><?= $u->id ?></td>
  <td><?= $u->employee_no ?></td>
  <td><?= $u->name ?></td>
</tr>
<?php endforeach; ?>
</table>
