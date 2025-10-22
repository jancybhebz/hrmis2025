<h2>Attendance Reports</h2>
<form method="get">
    From: <input type="date" name="from">
    To: <input type="date" name="to">
    <button type="submit">Generate</button>
</form>
<?php if (!empty($report)): ?>
<table border="1">
<tr><th>Name</th><th>Total</th></tr>
<?php foreach($report as $r): ?>
<tr>
  <td><?= $r->name ?></td>
  <td><?= $r->total ?></td>
</tr>
<?php endforeach; ?>
</table>
<?php endif; ?>
